#CLI Controller
class Haiwet::CLI
    def call
        choice
    end

    def choice
        puts "Welcome to haiwet"

        input = nil
        while input != "exit" do
            puts "please enter the name of the service you want to see a list of"
            puts "1- courses"
            puts "2- products"
            input = gets.strip.downcase
            if input == "courses"
                cours_list
                option_cour
                done
            elsif input == "products"
                products_list
                option_prod
                done
            else
                puts "Didn't you understand?"
            end

        end

    end

    def products_list
        @products = Haiwet::Product.list
        @products.each.with_index(1) do |prod, i|
            puts "#{i}. #{prod.name}"
        end
    end
    def cours_list
        @cours = Haiwet::Cour.list
        @cours.each.with_index(1) do |cour, i|
            puts "#{i}. #{cour.name}"
        end
    end

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

    def done
        puts "Done"
    end

end