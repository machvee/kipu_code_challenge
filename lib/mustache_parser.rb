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

  def self.word_commands(cmd)
    {
      space_join: ->(words) { words.join(' ') }
    }[cmd.to_sym]
  end

  def self.phrase_commands(cmd)
    {
      to_sentence: ->(phrases) { phrases.to_sentence }
    }[cmd.to_sym]
  end

  def field_spec_parse(e)
    # e.g 'patient.medications > name, dosage, route, frequency, “to”, necessity | space_join | to_sentence'
    word_processor = phrase_processor = ->(arg) {arg.dup}
    models, formatting = e.split(">") # ['patient.medications', ' name, dosage, route, ...']
    attrs = []
    if formatting.present?
      attr_list, *commands = formatting.split("|").map(&:squish) # ['name, dosage, route, ...', 'space_join', 'to_sentence']
      attrs = attr_list.split(",").map(&:squish) # ['name', 'dosage', 'route', 'frequence', '"to"', 'necessity']
      word_processor = MustacheParser.word_commands(commands[0]) if commands[0]
      phrase_processor = MustacheParser.phrase_commands(commands[1]) if commands[1]
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
