require_relative "./song.rb"
require_relative "./artist.rb"

class MP3Importer
    def initialize(path)
        @path = path
    end

    attr_accessor :path, :files

def files
    Dir.children(self.path)
end

def import
    arr =[]
    self.files.each do |filename|
        arr << Song.new_by_filename(filename)
    end
    arr
end


# path  = "./spec/fixtures/mp3s"


end