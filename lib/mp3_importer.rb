# require "../spec/mp3s/Action Bronsin - Larry Csonka - indie.mp3"
require "pry"

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end 

    def files
       list = Dir[@path + "/*"]
       list.map {|file| file.split("/")[-1]}


        # music_importer = MP3Importer.new(test_music_path)
    end

    def import 
        files.each {|file| Song.new_by_filename(file)}
    end 
end     





