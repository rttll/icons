module Icons
  # icon_root = File.dirname(__FILE__)
  BASE = "https://vue-icon-packs-7amyi38f5-thisadrian.vercel.app/api/icon"
  
  module ViewHelpers
    def icon(arg)

      lib = arg.split('/')[0]
      name = arg.split('/')[1]
      
      create_dir(lib)
      get_icon(lib, name) 
      
      path = icon_path(lib, name)
      svg = File.read(path).html_safe
    end

    def method_missing(*args)
      p 'foo', args
    end
  
    private
    
    def icon_root 
      Rails.root.join('lib/assets/svg_icons').to_s
    end
  
    def icon_path(lib, name)
      "#{icon_root}/#{lib}/#{name}.svg"
    end
  
    def get_icon(lib, name)
      path = icon_path(lib, name)
      return unless Rails.env.development? && !File.file?(path)
      
      
      uri = URI("#{BASE}/#{lib}?icon=#{name}")
      res = Net::HTTP.get_response(uri)
      
      if res.is_a?(Net::HTTPSuccess)
        File.write(path, res.body)
      end
    end
  
    def create_dir(lib)
      dir = "#{icon_root}/#{lib}"
      unless File.directory?(dir)
        FileUtils.mkdir_p(dir)
      end
    end

  end
end