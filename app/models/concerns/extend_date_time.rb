require 'active_support/concern'

module ExtendDateTime
  extend ActiveSupport::Concern

  def date
    moment.to_date.to_s
  end

  def time
    moment.localtime.strftime("%H:%M:%S")
  end
end
