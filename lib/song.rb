require 'pry'
class Song

attr_accessor :artist, :name, :artist_name

@@all = []
def initialize (name)
    @name = name
    @@all << self
end

def self.all
    @@all
end

def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
end

def self.new_by_filename(file_name)
    files_split = file_name.split(" - ")

    new_song = Song.new(files_split[1])
    
    new_song.artist_name = (files_split[0])

    new_song
    
    
    # file_split[2].split(".")[0]
    # binding.pry

    # binding.pry


end

# def artist_name=(artist)
#     @artist = artist
# end






end