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

  WORD_COMMANDS = {
    space_join: ->(words) { words.join(' ') }
  }

  PHRASE_COMMANDS = {
    to_sentence: ->(phrases) { phrases.to_sentence }
  }

  def self.word_commands(cmd)
    WORD_COMMANDS[cmd]
  end

  def self.phrase_commands(cmd)
    PHRASE_COMMANDS[cmd]
  end

  def field_spec_parse(e)
    # e.g 'patient.medications > name, dosage, route, frequency, “to”, necessity | space_join | to_sentence'
    word_processor = phrase_processor = ->(arg) {arg.dup}
    models, formatting = e.split(">") # ['patient.medications', ' name, dosage, route, ...']
    attrs = []
    if formatting.present?
      attr_list, *commands = formatting.split("|").map(&:squish) # ['name, dosage, route, ...', 'space_join', 'to_sentence']
      attrs = attr_list.split(",").map(&:squish) # ['name', 'dosage', 'route', 'frequence', '"to"', 'necessity']
      commands.map(&:to_sym).each do |cmd|
        word_processor = MustacheParser.word_commands(cmd) if WORD_COMMANDS[cmd].present?
        phrase_processor = MustacheParser.phrase_commands(cmd) if PHRASE_COMMANDS[cmd].present?
      end
    end
    messages = models.split(".").map(&:squish) # ['patient', 'medications']
    obj = @context[messages.first.to_sym]
    messages[1..-1].each do |msg|
      obj = obj.send(msg)
    end
    if attrs.empty? 
      # obj is an attribute
      obj
    else
      # obj is a collection
      phrases=[]
      obj.each do |row|
        words = []
        attrs.each do |attr|
          words << if m = attr.match(/"([^"]*)"/)
            m[1]
          else
            row.send(attr)
          end
        end
        phrases << word_processor[words]
      end
      phrase_processor[phrases]
    end
  end
end
