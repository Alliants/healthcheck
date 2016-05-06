module Healthcheck
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env["PATH_INFO"] == "/healthcheck"
        if Healthcheck.passed?
          [200, {}, ["OK"]]
        else
          [500, {}, ["Healthcheck Failed"]]
        end
      else
        @app.call(env)
      end
    end
  end
end
