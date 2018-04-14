module DefaultPageContent
   extend ActiveSupport::Concern
   
   include do
       before_action :set_page_defaults
    end
   
    def set_page_defaults
        @page_title= "Zabrina's Portfolio"
        @seo_keywords= "Zabrina Larsons portfolio"
    end
end