require 'flashdance'

ActionController::Base.send :include, Quirkey::Flashdance
ActionController::Base.before_filter :flash_ahead

Quirkey::Flashdance::Loader.yml_path = File.join(RAILS_ROOT,'app','views','shared','flash.yml')