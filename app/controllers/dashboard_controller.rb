class DashboardController < ApplicationController
  include ActionController::Live

  def index
  end

  def events
    response.headers['Content-Type'] = 'text/event-stream'

    sse = SSE.new(response.stream, retry: 300, event: "notification")
    redis = redis_connection

    begin
      redis.subscribe('stocks.create') do |on|
        on.message do |channel, msg|
          sse.write({ message: msg, date: Time.now })
        end
      end
    rescue
      # log ...
    ensure
      redis.quit
      sse.close
    end
  end

end
