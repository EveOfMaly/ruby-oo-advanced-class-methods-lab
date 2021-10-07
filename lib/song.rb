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

  def self.find_by_name(search)
    self.all.find {|object| object.name == search}
  end

  def self.find_or_create_by_name(search)
    if self.find_by_name(search) == nil 
      self.create_by_name(search)
    else
      self.find_by_name(search)
    end
  end

  def self.alphabetical
    self.all.sort { |a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file_name)
    trim = file_name.split("-")
    artist_name = trim[0].strip
    trim_nomp3 = trim[1].split(".")
    name =  trim_nomp3[0].strip 

    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song

  end

  def self.create_from_filename(file_name)
    trim = file_name.split("-")
    artist_name = trim[0].strip
    trim_nomp3 = trim[1].split(".")
    name =  trim_nomp3[0].strip 

    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song.save 
    song
  end

  def self.destroy_all
    self.all.clear 
  end


end