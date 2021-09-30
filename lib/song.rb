require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new 
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = Song.new 
    song.name = name
    song.save  
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end


  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
 
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    #   self.create_by_name(name)
    # 
  
  end


  def self.alphabetical
    # @@all.each.name.sort { |a, b| a.name <=> b.name} #spaceship compare the first and second name attribute
    self.all.sort { |a, b| a.name <=> b.name }

    ##@@all.sort_by {|song| song.name} <-----preferred
  end

  def self.new_from_filename(filename)
    # filename = filename.split("-")
    # artistName = filename[0].strip
    # title = filename[1].strip
    # titleClean = title.split(".")

    artistName = filename.split("-")[0].strip
    titleClean = filename.split("-")[1].strip.split(".")

    song = Song.new

    song.name = titleClean[0]
    song.artist_name = artistName 
    song
  end


  def self.create_from_filename(filename)

    artistName = filename.split("-")[0].strip
    titleClean = filename.split("-")[1].strip.split(".")

    song = Song.new

    song.name = titleClean[0]
    song.artist_name = artistName 
    song.save 
    song
  end


  def self.destroy_all
    self.all.clear
  end
end
