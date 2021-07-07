require_relative 'mp3_importer.rb'
require_relative 'artist.rb'
require 'pry'

class MP3Importer

    attr_accessor :path 

    @@all = []

    def initialize (path)
        @path = path

        @@all << self
    end

    def self.all
        @@all
    end

    def files
        files = Dir[@path + '/*']
        new_files = files.map{|file_name| file_name.split("/")[4]}
    end
    
    def import
        files.each{|file| Song.new_by_filename(file)}
    end
    
end