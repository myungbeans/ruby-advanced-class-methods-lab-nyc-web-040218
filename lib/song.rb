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
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song 
  end


  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song 
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      return song = self.find_by_name(name) 
    else 
      song = Song.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name.downcase}
  end

  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    artist_name, name = filename.split(' - ')
    
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song.save 

    return song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    return song
  end


  def self.destroy_all
    self.all.clear
  end
end

# Pry.start
# puts "Hi"
