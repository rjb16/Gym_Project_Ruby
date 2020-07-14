require_relative("../db/sql_runner")

class Booking

    attr_reader :member_id, :gym_class_id, :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @member_id = options['member_id'].to_i
        @gym_class_id = options['gym_class_id'].to_i
    end

    def save()
        sql = "INSERT INTO bookings (member_id, gym_class_id)
        VALUES ($1, $2)
        RETURNING id"
        values = [@member_id, @gym_class_id]
        booking = SqlRunner.run(sql, values).first
        @id = booking['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE from bookings"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * from bookings"
        results = SqlRunner.run(sql)
        return results.map { |booking| Booking.new(booking) }
    end
    
    def self.find(id)
        sql = "SELECT * FROM bookings WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        return Booking.new(results.first)
    end

    def update()
        sql = "UPDATE bookings
        SET (name, date, price) = ($1, $2,)
         WHERE id = $4"
        values = [@member_id, @gym_class_id, @id]
        SqlRunner.run(sql, values)
    end

    def member()
        sql = "SELECT * FROM members WHERE id = $1"
        values = [@member_id]
        member = SqlRunner.run(sql, values)
        results = member.map(){|member| Member.new(member)}
        return results.first
    end


end