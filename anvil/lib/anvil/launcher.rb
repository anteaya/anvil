module Anvil
  # To be cool, we use the launcher class. BootLoader and Initializer were taken (Merb/Rails)
  class Launcher
    def initialize(config)
      @config = config
      configure_application
    end
    
    def configure_application
      %w[view model controller].each do |component|
        Anvil.push_path(component.to_sym, Anvil.root_path("app/#{component}s"))
      end
      Anvil.push_path(:application,  Anvil.root_path("app/controllers/application.rb"))
      Anvil.push_path(:config,       Anvil.root_path("config"))
      Anvil.push_path(:log,          Anvil.log_path)
    end
  end
end