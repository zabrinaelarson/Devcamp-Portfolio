module DefaultPageContent
   extend ActiveSupport::Concern
   
   included do
       before_action :set_page_defaults
    end
   
    def set_page_defaults
        @page_title= "Zatisfy"
        @seo_keywords= "Zabrina Larsons portfolio zatisfy zatisfy's web developer free lance contract building website buisness small"
    end
end