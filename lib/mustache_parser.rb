class MustacheParser
  MUSTACHE_RE = /{{([^}]*)}}/

  def parse(context)
    # context = {
    #   facility: facility,
    #   patient: patient
    # }
    output = ""
    m = matches(placeholder, MUSTACHE_RE)
    m.each do |match|
      str = fields_spec_parse(m[1], context)
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

  def fields_spec_parse(e, context)
    # e.g 'patient.medications > name, dosage, route, frequency, “to”, necessity | space_join | to_sentence'
    word_processor = phrase_processor = ->(arg) {arg.dup}
    models, formatting = e.split(">") # ['patient.medications', ' name, dosage, route, ...']
    attr_list = []
    if formatting.present?
      attr_list, commands = formatting.split("|").map(&:squish) # ['name, dosage, route, ...', 'space_join', 'to_sentence']
      attrs = attr_list.split(",").map(&:squsih) # ['name', 'dosage', 'route', 'frequence', '"to"', 'necessity']
      word_processor = MustacheParser.word_commands(commands[0]) if commands[0]
      phrase_processor = MustacheParser.phrase_commands(commands[1]) if commands[1]
    end
    messages = models.split(".") # ['patient', 'medications']
    obj = context[messages.first.to_sym]
    messages[1..-1].each do |msg|
      obj = obj.send(msg)
    end
    if attr_list.empty? 
      # obj is an attribute
      obj
    else
      # obj is a collection
      phrases=[]
      obj.each do |row|
        words = []
        attr_list.each do |attr|
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

  def matches(s, re)
    start_at = 0
    [].tap do |matches|
      while(m = s.match(re, start_at))
        matches.push(m)
        start_at = m.end(0)
      end
    end
  end
end
