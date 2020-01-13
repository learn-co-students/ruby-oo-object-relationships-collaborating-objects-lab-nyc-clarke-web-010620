class Artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    attr_accessor :name
    def self.all
        @@all
    end
    def add_song(song)
        song.artist = self
    end
    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end
    def self.find_or_create_by_name(name)
        artist_names = @@all.map do |artist|
            artist.name
        end
        if artist_names.include?(name)
            @@all.find do |artist|
                artist.name == name
            end
        else
            Artist.new(name)
        end
    end
    def print_songs
        song_names = songs.map do |song|
            song.name
        end
        puts song_names
    end
end
