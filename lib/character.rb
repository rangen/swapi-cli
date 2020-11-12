class Character

    attr_accessor :name, :type, :effect

    @@all = []
    @@saved_characters = []

    def initialize(name, height, mass, hair_color)
        @name = name 
        @type = type
        @effect = effect
        @@all << self
    end

    def self.all
        @@all
    end

    def self.where(type)
        all.filter{|spell| spell.type == type}
    end

end