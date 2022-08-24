

class Song

  attr_accessor :name, :album,:id
  @@all=[]
  def initialize(name:, album:,id:nil)
    @name = name
    @album = album
    @id=id
  end
  def self.create_table
    sql= <<-SQL
    CREATE TABLE IF NOT EXISTS songs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      album TEXT
    )
    SQL
    DB[:conn].execute(sql)
  end

  def last_id
    query = <<-SQL
      SELECT * FROM songs ORDER BY id DESC LIMIT 1;
    SQL
    DB[:conn].execute(query).map{
      |row|
      row[0][0]
    }
  end

  def save
    sql = <<-SQL
      INSERT INTO songs(name, album)
      VALUES(?, ?)
    SQL
    DB[:conn].execute(sql,self.name,self.album,)
    Song.new(self.name,self.album,last_id)
  end

  def self.create(name:,album:)
    song = Song.new(name: name, album: album)
    song.save
    song
   
  end
  
  def self.all_students
    query=<<-SQL
      SELECT * FROM songs
    SQL
    DB[:conn].execute(query)

  end

end

