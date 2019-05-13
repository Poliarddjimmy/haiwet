class Haiwet::Product
    attr_accessor :name, :price, :availability, :url, :size
    
    def self.list
        self.scrape_product
    end

    def self.scrape_product
        self.scrape_10kont
    end

    def self.scrape_10kont
        doc = Nokogiri::HTML(open('./site/10kont/index.html'))
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