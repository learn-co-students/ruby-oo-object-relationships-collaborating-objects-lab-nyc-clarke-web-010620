require_relative 'mp3_importer.rb'
require_relative 'song.rb'
require 'pry'


class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize (name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end


    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        found = self.all.find{|artist| artist.name == name}

        if !found
            return Artist.new(name)
        else 
            return found
        end
    end

    def print_songs
        songs.each{|song| puts song.name}
    end


end
