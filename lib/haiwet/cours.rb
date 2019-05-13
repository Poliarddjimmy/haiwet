class Haiwet::Cour
    attr_accessor :name, :price, :description, :content_title, :content_description
    
    def self.list
        self.scrape_cour
    end

    def self.scrape_cour
        cours = []
        cours << self.scrape_cours
        cours
    end

    def self.scrape_cours
        doc = Nokogiri::HTML(open('./site/cours/index.html'))
        #binding.pry
        cour = self.new
        cour.name = doc.search("h1.clp-lead__title").text
        cour.description = doc.search("div.clp-lead__headline").text
        cour.price = doc.search("span.lajan").text

        cour.content_title = doc.search("span.section-title-text.pre").text
        cour.content_description = doc.search("div.description.collapse.pre").text.strip
        cour
    end
end