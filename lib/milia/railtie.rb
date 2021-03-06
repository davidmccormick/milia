require 'milia'
require 'rails'

module Milia
  class Railtie < Rails::Railtie
    initializer :after_initialize do
 
        ActiveRecord::Base.send(:include, Milia::Base)
        ActionController::Base.send(:include, Milia::Control)
        
        require File.dirname(__FILE__) + '/../../app/controllers/registrations_controller'
    end

    rake_tasks do
      load 'milia/tasks.rb'
    end
  end
end
