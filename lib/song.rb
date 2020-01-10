class Song
    def initialize(name)
        @name = name
        @artist = nil
        @@all << self

    end

    @@all = []

    attr_accessor :name, :artist

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        arr = file.split("-")
        artist = arr[0].strip
        song_name = arr[-2].strip

        track = Song.new(song_name)
        track.artist = Artist.find_or_create_by_name(artist)
        track
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end