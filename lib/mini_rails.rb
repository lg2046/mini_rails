require "mini_rails/version"
require "mini_rails/dependency"
require "active_support/all"

require "mini_rails/controller"

module MiniRails
  class Application
    def call(env)
      controller_name, action_name = get_controller_and_action(env["PATH_INFO"])
      controller = "#{controller_name.capitalize}Controller".constantize.new

      request = Rack::Request.new(env)
      response = Rack::Response.new

      controller.request = request
      controller.response = response

      controller.send action_name

      response.finish
    end

    def get_controller_and_action(path)
      _, controller, action = path.split("/")
      [controller || "home", action || "index"]
    end
  end
end
