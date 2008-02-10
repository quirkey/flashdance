require 'test/unit'
require File.expand_path(File.join(File.dirname(__FILE__), '../lib/flashdance'))

class Test::Unit::TestCase
  
  protected
  def current_path
    File.expand_path(File.dirname(__FILE__))
  end
  
  def yml_path
    File.join(current_path, 'flash.yml')
  end
  
end