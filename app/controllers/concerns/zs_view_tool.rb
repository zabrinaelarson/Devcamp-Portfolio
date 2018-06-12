module ZsViewTool
    extend ActiveSupport::Concern
    
    included do
        before_action :set_copyright
    end
    
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
  
  def set_copyright
    @copyright = ZsViewTool::Renderer.copyright 'Zabrina Larson', 'All Rights Reserved'  
  end
  
end