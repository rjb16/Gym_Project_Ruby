require_relative("../db/sql_runner")

class Booking

    attr_reader :member_id, :gym_class_id, :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @member_id = options['member_id'].to_i
        @gym_class_id = options['gym_class_id'].to_i
    end
