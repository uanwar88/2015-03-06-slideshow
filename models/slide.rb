class Slide
  attr_accessor :title, :body, :number

  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @number = options["number"].to_i
  end

  def insert
    DATABASE.execute("INSERT INTO slides (title, body, number) VALUES ('#{@title}', '#{@body}', #{@number})")
    @id = DATABASE.last_insert_row_id
  end

  def update
    DATABASE.execute("UPDATE slides SET body = '#{@body}', title = '#{@title}', number = #{@number} WHERE id = #{@id}")
  end

  # Returns slide as an object
  def self.find(number)
    result = DATABASE.execute("SELECT * FROM slides WHERE number = #{number}")
    if result.length >= 1
      self.new(result[0])
    end
  end

  def self.fetch_all
    DATABASE.execute("SELECT * FROM slides ORDER BY number ASC")
  end

  def to_hash
    {
      id: @id,
      title: @title,
      body: @body,
      number: @number
    }
  end
end
