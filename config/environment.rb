require 'bundler'
Bundler.require

require_relative '../lib/song'

DB = { conn: SQLite3::Database.new("db/music.db") }
Song.create_table
hello = Song.new(name: "Hello", album: "25")
hello.save
ninety_nine_problems = Song.new(name: "99 Problems", album: "The Black Album")
ninety_nine_problems.save
song=Song.create(name: "Hello", album: "25")
p song.name
song.album



p DB[:conn].execute("PRAGMA table_info(songs)")
