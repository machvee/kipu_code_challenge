class MustacheParser
  MUSTACHE_RE = /{{([^}]*)}}/

  def initialize(context)
    # context = {
    #   facility: facility,
    #   patient: patient
    # }
    @context = context
  end

  def parse(template)
    template.gsub(MUSTACHE_RE) do |template_expression|
      field_spec_parse(template_expression.match(MUSTACHE_RE)[1])
    end
  end

  private

  class CmdProcessor
    attr_reader :word_processor, :phrase_processor

    WORD_COMMANDS = {
      space_join: ->(words) { words.join(' ') }
    }

    PHRASE_COMMANDS = {
      to_sentence: ->(phrases) { phrases.to_sentence }
    }

    def initialize
      @word_processor = WORD_COMMANDS[:space_join]
      @phrase_processor = ->(arg) {arg.dup}
    end

    def parse(commands)
      commands.map(&:to_sym).each do |cmd|
        set_processor(cmd)
      end
    end

    private

    def set_processor(cmd)
      if WORD_COMMANDS.has_key?(cmd)
        @word_processor = WORD_COMMANDS[cmd]
      elsif PHRASE_COMMANDS.has_key?(cmd)
        @phrase_processor = PHRASE_COMMANDS[cmd]
      else
        raise("#{cmd} is not a supported command")
      end
    end
  end

  def expr_eval(expr, receiver=nil)
    messages = expr.split(".").map(&:squish) # ['patient', 'medications'] or ['moment', 'date']
    obj = receiver.present? ? receiver : @context[messages.shift.to_sym]
    messages.each do |msg|
      obj = case msg
      when 'time'
        obj.localtime.strftime("%H:%M:%S")
      when 'date'
        obj.to_date.to_s
      else
        obj.send(msg)
      end
    end
    obj
  end

  def field_spec_parse(e)
    # e.g 'patient.medications > name, dosage, route, frequency, “to”, necessity | space_join | to_sentence'
    commander = CmdProcessor.new

    models, formatting = e.split(">") # ['patient.medications', ' name, dosage, route, ...']
    attrs = []
    if formatting.present?
      attr_list, *commands = formatting.split("|").map(&:squish) # ['name, dosage, route, ...', 'space_join', 'to_sentence']
      attrs = attr_list.split(",").map(&:squish) # ['name', 'dosage', 'route', 'frequency', '"to"', 'necessity']
      commander.parse(commands)
    end
    obj = expr_eval(models)
    if attrs.empty? 
      # obj must be an attribute
      obj
    else
      # obj is a collection
      collection = obj
      phrases=[]
      collection.each do |record|
        words = []
        attrs.each do |attr|
          words << if m = attr.match(/"([^"]*)"/)
            m[1]
          else
            expr_eval(attr, record)
          end
        end
        phrases << commander.word_processor[words]
      end
      commander.phrase_processor[phrases]
    end
  end
end
