class ApplicationController < ActionController::Base
  layout false

  before_filter :set_cors_policy

  def page_not_found
    render nothing: true, status: :not_found
  end

  private

  def set_cors_policy
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PATCH, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
