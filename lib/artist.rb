class Artist

attr_accessor :name, :songs

@@all = []

def initialize(name)
    @name = name

    @@all << self
end

def self.all
    @@all
end

def songs
    Song.all.select do |song|
        song.artist == self
    end

end

def add_song(song)
    #returns an array of this specific artists songs

    song.artist = self


end

def self.find_or_create_by_name(name)
    
    found = @@all.find do |artist|
        artist.name == name
    end

    if !found
        found = self.new(name)
    end

    found
end

def print_songs 
    songs.each do |song|
        puts song.name
    end
end


end 