require_relative('../db/sql_runner')

class Member

    attr_reader :first_name, :last_name, :age, :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @age = options['age']
    end

    def save()
        sql = "INSERT INTO members (first_name, last_name, age)
        VALUES
        ($1, $2, $3)
        RETURNING id"
        values = [@first_name, @last_name, @age]
        member = SqlRunner.run(sql, values).first
        @id = member['id'].to_i
    end

    def self.delete_all
        sql = "DELETE FROM members"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * from members"
        results = SqlRunner.run(sql)
        return results.map { |member| Member.new(member) }
    end

    def self.find(id)
        sql = "SELECT * FROM members WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        return Member.new(results.first)
    end

    def update()
        sql = "UPDATE members
        SET (first_name, last_name, age) = ($1, $2, $3)
        WHERE id = $4"
       values = [@first_name, @last_name, @age, @id]
       SqlRunner.run(sql, values)
    end

    def self.map_items(data)
        return data.map { |member| Member.new(member)}
    end
    
    def gym_classes()
        sql = "SELECT gym_classes.* FROM gym_classes INNER JOIN bookings
        ON gym_classes.id = bookings.gym_class_id
        WHERE member_id = $1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return results.map { |gym_class| Gym_class.new(gym_class)}
       
    
    end
    
    def delete()
        sql = "DELETE FROM members
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end


    # Deletes booking with member if member is booked in to a gym_class, stops foreign key violation
    def delete_bookings()
        sql = "DELETE FROM bookings
        WHERE bookings.member_id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end




end



