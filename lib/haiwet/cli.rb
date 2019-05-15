#CLI Controller
class Haiwet::CLI
    #this method display the method witch created a list of option for the user
    def call
        choice
    end
    
    #this method display the list of option for the user
    def choice
        puts "Welcome to haiwet"

        input = nil
        while input != "exit" do
            puts "please enter the name of the service you want to see a list of"
            puts "1- courses"
            puts "2- products"
            puts "3- Other"
            input = gets.strip.downcase
            if input == "courses"
                cours_list
                option_cour
                done
            elsif input == "products"
                products_list
                option_prod
                done
            elsif input == "other"
                site_list
                option_site
                done
            else
                puts "Didn't you understand?"
            end

        end

    end
    
    #in this method, we call the class Haiwet::Product to display the lis of products avalaible
    def products_list
        @products = Haiwet::Product.list
        @products.each.with_index(1) do |prod, i|
            puts "#{i}- #{prod.name}"
        end
    end

    #in this method, we call the class Haiwet::Cour to display the lis of courses avalaible
    def cours_list
        @cours = Haiwet::Cour.list
        @cours.each.with_index(1) do |cour, i|
            puts "#{i}- #{cour.name}"
        end
    end

    #in this method, we call the class Haiwet::Site to display the lis of sites avalaible
    def site_list
        @sites = Haiwet::Site.list
        @sites.each.with_index(1) do |site, i|
            puts "\n #{i}- #{site.name}"
        end
    end
    
    #after choosing an option, this method send the response  for site
    def option_site
        input = nil
        while input != "exit" do 
            puts "\n please enter the number of the site you want to see more about"
            input = gets.strip.downcase
            if input.to_i != 0
                site = @sites[input.to_i-1]
                if site
                    puts "#{site.name} \n #{site.description}"
                else
                    puts "\n Warning: There is no site associate with this number"
                end
            elsif input == "back"
                site_list
            else
                puts "\n Warning: The system don't understand your input. please tape back or exit"
            end
        end
    end
    
    #after choosing an option, this method send the response for courses
    def option_cour
        input = nil
        while input != "exit" do 
            puts "please enter the number of the cours you want to see more about"
            input = gets.strip.downcase
            if input.to_i != 0 
                cour = @cours[input.to_i-1]
                if cour
                    puts "#{cour.name}"
                    puts "#{cour.description}"
                    puts "#{cour.price}"
                    input = nil
                    puts "Please, tape content to see more or tape exit"
                    while input != "exit" do
                        input = gets.strip.downcase
                        if input == "content"
                            puts "#{cour.content_title}"
                            puts "#{cour.content_description}"
                        else
                            puts "Please, tape content to see more or tape exit"
                        end
                    end
                else
                    puts "There is no cours associate with this number"
                end
            elsif input == "back"
                cours_list
            else
                puts "The system don't understand your input. please tape back or exit"
            end
            

        end
    end
    

    #after choosing an option, this method send the response for products
    def option_prod
        input = nil
        while input != "exit" do 
            puts "please enter the number of the product you want to see more about"
            input = gets.strip.downcase
            if input.to_i != 0 
                product = @products[input.to_i-1]
                if product
                    puts "#{product.name} - #{product.price} - #{product.availability}"
                else
                    puts "There is no Product associate with this number"
                end
            elsif input == "back"
                products_list
            else
                puts "The system don't understand your input. please tape back or exit"
            end
            

        end
    end
    
    #display done when exit the application
    def done
        puts "Done"
    end

end