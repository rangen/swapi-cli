require 'pry'
class CLI
    def initialize
        start
    end

    def start
        puts "Good evening! You've got a good reason to be out of bed at this hour I'm sure!"
        sleep(1)
        self.menu
        self.second_menu
    end

    def menu
        response = $prompt.select("Tell me, are you perhaps interested in doing some less-than-permissible wandwork tonight?", ["Yes", "No"])
        clear_screen
        if response == "Yes"
            display_types_of_spells
        else 
            puts "Well then I see no reason that you shouldn't get back to your dormitory immediately! A pleasant evening to you!"
        end
    end

    def display_types_of_spells
        spell_types = Spell.all.map {|spell| spell.type}.uniq
        chosen_type = $prompt.select("Splendid! Now which type of spells are you having trouble with?", spell_types)
        
        spells = retrieve_list_by_type(chosen_type)
        spell_names = spells.map{|spell| spell.name}
        
        chosen_spell_name = $prompt.select("Ah certainly, I'd be happy to tell you more about these!", spell_names)
        display_spell_effect(chosen_spell_name)
    end
        
    def retrieve_list_by_type(type)
        return Spell.all.filter{|spell| spell.type == type}
    end
    
    def display_spell_effect(response)
        chosen_spell = Spell.all.find{|spell| spell.name == response}
        
        messages = {"Charm" => "Remember, a lot of the work here is going to come from the motion of your wand, each charm relies on how it is cast not only it's incantation!",
            "Spell" => "I personally don't think you can never review the basics enough! A clear picture in the mind will render clear results!",
            "Curse" => "I would be remiss if I didn't say... you've really got to mean it when you cast a spell like this! Use with exreme caution... if ever!",
            "Hex" => "Tricky little spells, these are! A couple of good hexes are key in any young wizards arsenal for the occasional duel!",
            "Jinx" => "Haha! Oh I remember fondly the days when I used to cast these on friends! A lot of wizards underestimate how hard it is to reverse a well-cast jinx.",
            "Enchantment" => "Ohhh mysterious and wonderful incantations, these. The mind must be set and you must be full of intention to make an enchatment last. Don't be discouraged if they don't stick at first!"}
        
        puts "The effect of the #{chosen_spell.name} incantation is that it #{chosen_spell.effect}."
        puts messages[chosen_spell.type]
        
        end

    def second_menu
        response = $prompt.select("Would you like to see more?", ["Yes", "No"])
        if response = "Yes"
            display_types_of_spells
        else 
            puts "Well then I see no reason that you shouldn't get back to your dormitory immediately! A pleasant evening to you!"
        end
    end
        
    def clear_screen
        system "clear"
    end
        
end