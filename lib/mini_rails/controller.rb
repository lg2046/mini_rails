require_relative "filter"
require_relative "view"

module MiniRails
  class Controller
    attr_accessor :request, :response

    include Filter
    include View
    
    def controller_name
      self.class.name.underscore.gsub("_controller", "")
    end
  end
end