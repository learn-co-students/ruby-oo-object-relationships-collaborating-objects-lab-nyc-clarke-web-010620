require 'pry'
class Song
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    attr_accessor :name, :artist
    def self.all
        @@all
    end
    def artist_name=(artist_name)
        #binding.pry
        Artist.find_or_create_by_name(artist_name)
        artist_inst = Artist.all.find do |artist|
            artist.name = artist_name
        end
        artist_inst.add_song(self)
    end
    def self.new_by_filename(filename)
        filename_array = filename.split(' - ')
        new_song = Song.new(filename_array[1])
        new_song.artist = filename_array[0]
        new_song.artist_name=(new_song.artist)
        # Artist.find_or_create_by_name(new_song.artist)
        # artist = Artist.all.find do |artist|
        #     artist.name = new_song.artist
        # end
        # artist.add_song(new_song)
        #binding.pry
        return new_song
    end
end