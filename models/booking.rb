require_relative("../db/sql_runner")

class Booking

    attr_reader :member_id, :gym_class_id, :id

    def initialize(options)
        