class ActionController::Base 
  alias :ac_flash :flash
  def flash(*args)
    return ac_flash(*args) if args.empty? || args.first.nil? || args.first === true || args.first == :refresh
    case args.first
    when Hash
      args.first.each do |flash_key, name|
        ac_flash[flash_key] = flashdance(name)
      end
    end
  end
end