class ApplicationController < ActionController::Base
  def selected_or_default_date(dates)
    default = dates.first || Time.zone.today
    selected = Date.parse(params[:date]) if params[:date]
    selected || default
  rescue Date::Error
    default
  end
end
