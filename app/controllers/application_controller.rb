class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def redis_connection
    ENV.include?('REDISTOGO_URL') ? Redis.new(url: ENV['REDISTOGO_URL']) : Redis.new
  end
end
