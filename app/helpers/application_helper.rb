module ApplicationHelper
  MUSTACHE_RE = /{{([^}]*)}}/

  def parse_placeholder(input)
    m = matches(input, MUSTACHE_RE)
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
