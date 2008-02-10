# flashdance install script
require 'fileutils'

# copy example flash.yml
default_path = File.join(RAILS_ROOT,'app','views','shared','flash.yml')
if File.exists?(default_path)
  puts "#{default_path} already exists . . . skipping"
else
  puts "Installing example flash.yml to #{default_path}"
  FileUtils.mkdir_p(File.dirname(default_path))
  File.cp(File.join(File.dirname(__FILE__),'examples','flash.yml'), default_path)
end

puts IO.read(File.join(File.dirname(__FILE__), 'README'))

