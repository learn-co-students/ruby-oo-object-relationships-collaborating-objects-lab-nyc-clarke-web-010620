class Artist
    def initialize(name)
        @name = name
        @@all << self
    end

    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def add_song(new_song)
        new_song.artist = self
    end

    def songs 
        Song.all.select do |songs| 
            songs.artist == self
        end
    end

    def self.find_or_create_by_name(name)
        found = false
        self.all.each do |artist|
            if artist.name == name
                found = artist
            end
        end
        if found == false 
            found = Artist.new(name)
        end
        found
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end






end
