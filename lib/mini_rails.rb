require "mini_rails/version"
require "mini_rails/dependency"
require "active_support/all"

require "mini_rails/controller"

require "mini_rails/router"

module MiniRails
  class Application
    include Router

    def call(env)
      controller_name, action_name = get_controller_and_action(env["PATH_INFO"])
      controller = "#{controller_name.capitalize}Controller".constantize.new

      request = Rack::Request.new(env)
      response = Rack::Response.new

      controller.request = request
      controller.response = response

      controller.filter do
        controller.send action_name
        controller.send :render, action_name.to_sym unless controller.is_rendered?
      end

      response.finish
    end
  end

  def self.set_root(path)
    @root = path
  end
  
  def self.root
    @root
  end
end
