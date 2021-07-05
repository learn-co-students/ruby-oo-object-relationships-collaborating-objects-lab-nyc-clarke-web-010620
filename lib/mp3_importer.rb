require 'pry'
class MP3Importer
    def initialize(path)
        @path = path
    end
    attr_accessor :path
    def files
        Dir.entries(@path).select{|f| !File.directory? f}
        #binding.pry
        #solution courtesy of Emiliano Poggi via StackOverflow
    end
    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end
end