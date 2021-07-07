require_relative 'mp3_importer.rb'
require_relative 'artist.rb'
require 'pry'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize (name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)

        song = self.new()
    end

    def self.songs
        Song.all.select {|song| song.artist == self}
    end

    def self.new_by_filename(file_array)
        new_array = file_array.split(" - ")
        new_song = Song.new(new_array[1])
        new_song.artist_name=(new_array[0])
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end




end