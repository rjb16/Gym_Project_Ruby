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
        "DELETE from bookings"
        SqlRunner.run(sql)
    end

    def self.find(id)
        sql = "SELECT * FROM bookings WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        return Booking.new(results.first)
    end

end