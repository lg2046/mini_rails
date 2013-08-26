module MiniRails
  module Router
    def get_controller_and_action(path)
      _, controller, action = path.split("/")
      [controller || "home", action || "index"]
    end
  end
end