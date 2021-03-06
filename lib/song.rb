class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ||  self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end

  def self.new_from_filename filename
    song = self.new
    _filename = filename.split('-')
    song.name = _filename[1].strip.chomp('.mp3')
    song.artist_name = _filename[0].strip
    song
  end

  def self.create_from_filename filename
    song = self.new_from_filename(filename)
    song.save
    song
    
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end
end
