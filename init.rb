require 'flashdance'
require 'action_controller_extensions'

ActionController::Base.send :include, Quirkey::Flashdance
Quirkey::Flashdance::Loader.yml_path = File.expand_path(File.join(RAILS_ROOT,'app','views','shared','flash.yml'))
