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










end
