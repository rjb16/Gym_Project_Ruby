require_relative("../models/booking.rb")
require_relative("../models/gym_class.rb")
require_relative("../models/member.rb")
require("pry-byebug")

Member.delete_all()


member1 = Member.new({
    "first_name" => "Elon",
    "last_name" => "Musk",
    "age" => 36
})

member1.save()