class API


    def self.gather_spells
        url = "https://www.potterapi.com/v1/spells?key=$2a$10$L3jEFajgsSFFT.Ds4KPRDO4cFyTpipac5L1iYW.QoKD8VuBgzcnR2"
        uri = URI(url)
        spells = Net::HTTP.get(uri)
        spells_array = JSON.parse(spells)
        spells_array.each do |spell|
            Spell.new(spell["spell"], spell["type"], spell["effect"])
        end

    end

end
