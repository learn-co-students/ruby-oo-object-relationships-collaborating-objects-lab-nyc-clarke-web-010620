require 'pry'
class MP3Importer

attr_accessor :path, :files

@@all = []

def initialize (path)
    @path = path
    @files = []

    @@all << self
end

def self.all
    @@all
end

def files
    test =  Dir[@path + "/*"]
    test.map do |path|
        path.split("/")[4]
    end
end

def import
    files.each do |file_name|
        Song.new_by_filename(file_name)
    end
end

end