DATABASE = SQLite3::Database.new("/Users/usman/Code/2015-03-06-slideshow/database/slideshow.db")

DATABASE.execute("CREATE TABLE IF NOT EXISTS slides (id INTEGER PRIMARY KEY, title TEXT, body TEXT, number INTEGER UNIQUE)")

DATABASE.results_as_hash = true
