class Song 
    attr_accessor :name, :artist

    @@all = []
    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.artist_name(name) 
        Artist.all.find {|artist| artist.name == name}
    end 

    def self.new_by_filename(file_name)
        song = file_name.split("-")
        artist = song[0].strip
        song_name = song[1].strip

        new_song = self.new(song_name)
        new_song.artist_name = artist
        new_song

    end 

    def artist_name=(artist_name)
       self.artist = Artist.find_or_create_by_name(artist_name)
    end 


end 