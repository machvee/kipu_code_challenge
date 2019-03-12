class ApplicationController < ActionController::Base
  before_action :set_current_facility

  def set_current_facility
    @facility = Facility.find_by(name: CURRENT_FACILITY_NAME)
  end
end
