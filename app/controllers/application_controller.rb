class ApplicationController < ActionController::Base
  layout false

  def page_not_found
    render nothing: true, status: :not_found
  end
end
