class Haiwet::Product
    attr_accessor :name, :price, :availability
    
    def self.list
        #return the methed scrape_product
        self.scrape_product
    end
    
    #scrape data form site https://10kont.com/
    def self.scrape_product
        doc = Nokogiri::HTML(open('./site/10kont/index.html'))
        #doc = Nokogiri::HTML(open('https://10kont.com/'))
        #binding.pry
        products = []
        doc.search("div.col-lg-3.col-md-6").each do |prod|
            product = self.new
            product.name = prod.search("h4.product-title").text
            product.price = prod.search("span.woocommerce-Price-amount.amount").text
            product.availability = "Available"
            products << product
        end
        products
    end
end