require_relative("../db/sql_runner")

class Gym_class

    attr_reader :name, :date, :price, :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @date = options['date']
        @price = options['price']
    end

    def save()
        sql = "INSERT INTO gym_classes (name, date, price)
        VALUES
        ($1, $2, $3)
        RETURNING id"
        values = [@name, @date, @price]
        gym_class = SqlRunner.run(sql, values).first
        @id = gym_class['id'].to_i
    end

    def self.delete_all
        sql = "DELETE FROM gym_classes"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM gym_classes
        WHERE id = $1"
        values =[@id]
        SqlRunner.run(sql, values)
    end

    
    def self.find(id)
        sql = "SELECT * FROM gym_classes
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run( sql, values )
        return Gym_class.new(results.first)
    end

    def update()
      sql = "UPDATE gym_classes
      SET (name, date, price) = ($1, $2, $3)
       WHERE id = $4"
      values = [@name, @date, @price, @id]
      SqlRunner.run(sql, values)
    end

    def members()
        sql = "SELECT members.* FROM members INNER JOIN
        bookings ON members.id = bookings.member_id
        WHERE gym_class_id = $1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map { |member| Member.new(member)}
    end
        
    def self.all()
        sql = "SELECT * from gym_classes"
        results = SqlRunner.run(sql)
        return Gym_class.map_items(results)
    end

    # mapping method
    def self.map_items(data)
        return data.map {|gym_class| Gym_class.new(gym_class) }
   end

    

end
