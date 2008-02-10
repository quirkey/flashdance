require 'yaml'
require 'erb'

module Quirkey
  module Flashdance

    class NoEntryError < RuntimeError; end;
    class NoYAMLError < RuntimeError; end;

    def flash_ahead
      @flashdance_loader ||= Loader.new(binding)
    end

    def flashdance(name)
      flash_ahead
      @flashdance_loader.get(name)
    end
    
    class Loader

      def initialize(erb_binding = nil)
        @erb_binding = erb_binding || binding
        @entries = YAML::load(File.open(yml_path))
      end

      def get(name)
        name = name.to_s
        raise(NoEntryError, "There is no entry in your flashdance YAML file for #{name}") unless entries.has_key?(name)
        ERB.new(entries[name]).result(@erb_binding)
      end
      
      def entries
        @entries
      end
      
      def yml_path
        @@yml_path || raise(NoYAMLError, "You must specify a default YAML path with Quirkey::Flashdance.yml_path = ")
      end
      
      def self.yml_path=(path)
        @@yml_path = path
      end
    end

  end
end