class ActionController::Base 
  alias :ac_flash :flash
  def flash(*args)
    return ac_flash(*args) if args.empty? || args.first.nil? || args.first === true || args.first == :refresh
    case args.first
    when Hash
      args.first.each do |flash_key, name|
        text = (flashdance([controller_name, action_name, name]) || flashdance(name))
        ac_flash[flash_key] = text
      end
    when Symbol
      if args[1] && (args[1].is_a?(String) || args[1].is_a?(Symbol) || args[1].is_a?(Array))
        ac_flash[args[0]] = flashdance(args[1])
      elsif text = flashdance([controller_name, action_name, args[0]]) || text = flashdance([controller_name, action_name])
        ac_flash[args[0]] = text
      else
        ac_flash(*args)
      end
    end
  end
end