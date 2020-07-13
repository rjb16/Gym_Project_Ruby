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



     