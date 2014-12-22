class DashboardController < ApplicationController
  include ActionController::Live

  def index
  end

  def events
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300, event: "notification")

    begin
      # Aqui va la logica (puede ser un pub/sub en redis o postgres)
      if 1 == 1
        sse.write({ message: 'Hola', date: Time.now })
      end
    rescue
      # log ...
    ensure
      sse.close
    end
  end

end
