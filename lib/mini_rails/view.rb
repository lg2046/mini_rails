require "erubis"

module MiniRails
  module View
    attr_accessor :rendered
    
    def render(options)
      render_content = case options
      when Symbol
        render_as_string(options)
      when String
        options
      else
        "nothing"
      end
      
      response.write render_content
      @rendered = true
    end
    
    def render_as_string(action)
      file = MiniRails.root + "/views/#{controller_name}/#{action}.html.erb"
      eruby = Erubis::Eruby.new File.read(file)
      eruby.result
    end
  end
end