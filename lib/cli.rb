class CLI
    def initialize
        @tty_options = {
            per_page: 12,
            cycle:  true
        }

        clear_screen
        #fetch initial character list   the API returns x results, with links to the next page as needed
        fetch_and_set
        program_exit
    end

    def fetch_and_set(url='https://swapi.dev/api/people')
        response = API.fetch(url)
        @next = response["next"]
        @previous = response["previous"]
        @results = response["results"]
        @count = response["count"]
        main_menu
    end

    def main_menu
        choices = @results.map do |char|
            char["name"]
        end
        
        if @previous
            choices << "Previous Page"
        end

        if @next
            choices << "Next Page"
        end
        choices << "Exit"

        message = "Welcome, Star Wars nerd! \n\nThere are #{@count} known characters in the Galaxy\n\nWho would you like to learn more about?\n"
        choice = $prompt.select(message, choices, @tty_options)

        case choice
        when "Previous Page"
            fetch_and_set(@previous)
        when "Next Page"
            fetch_and_set(@next)
        when "Exit"
            #do nothing and let program exit cleanly from the recursive menus
        else
            show_character_detail(choice)
        end
    end

    def show_character_detail(character)
        #make our life easier by selecting the character we're viewing out of the hash and store its values in 'x'
        x = @results.find{|char| char["name"] == character}

        system "clear"
        puts
        puts "Showing known info for: #{character}"
        sleep 1
        puts
        puts "Height: #{x["height"]}"
        puts
        puts "Mass: #{x["mass"]}"
        sleep 1
        puts
        puts "Hair Color: #{x["hair_color"]}"
        puts
        puts "Skin Color: #{x["skin_color"]}"
        puts
        puts "Eye Color: #{x["eye_color"]}"
        puts
        sleep 1
        puts "Born: #{x["birth_year"]}"
        puts
        puts "Gender: #{x["gender"]}"
        puts "Returning to Main Menu..."
        sleep 3

        clear_screen
        main_menu
    end

    def program_exit
        clear_screen
        puts
        puts
        puts
        puts
        puts "May the force be with you ... always"
        sleep 2
    end

    def clear_screen
        system "clear"
    end
end