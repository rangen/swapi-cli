class Spell

    attr_accessor :name, :type, :effect

    @@all = []

    def initialize(name, type, effect)
        @name = name 
        @type = type
        @effect = effect
        @@all << self
    end

    def self.all
        @@all
    end

end