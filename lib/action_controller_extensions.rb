class ActionController::Base 
  alias :ac_flash :flash
  def flash(*args)
    return ac_flash(*args) if args.empty? || args.first.nil? || args.first === true || args.first == :refresh
    case args.first
    when Hash
      args.first.each do |flash_key, name|
        ac_flash[flash_key] = flashdance(name)
      end
    when Symbol
      if args[1] && (args[1].is_a?(String) || args[1].is_a?(Symbol))
        ac_flash[args[0]] = flashdance(args[1])
      end
    end
  end
end