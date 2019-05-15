class Haiwet::Site
    attr_accessor :name, :description
    
    #scrape data form site https://www.websitebuilderexpert.com/designing-websites/best-designed-websites/
    def self.list
        #doc = Nokogiri::HTML(open('https://www.websitebuilderexpert.com/designing-websites/best-designed-websites/'))
        doc = Nokogiri::HTML(open('./site/site/index.html'))
        #binding.pry
        sites = []
        #itereate over the class wpb_wrapper to build the liste of sites
        title = doc.css("h1.title.entry-title").text
        doc.css("div.wpb_wrapper").each do |site|
            sito = self.new
            sito.name = site.css("h2.taco-section-title").text
            sito.description = site.css("div.wpb_wrapper p").text

            #push the new objet created to the array 
            sites << sito if sito.name !=""
        end
        #return the array
        sites
    end
end