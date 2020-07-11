require_relative("../models/booking.rb")
require_relative("../models/gym_class.rb")
require_relative("../models/member.rb")
require("pry-byebug")

Member.delete_all()


member1 = Member.new({
    "first_name" => "Elon",
    "last_name" => "Musk",
    "age" => 49
})

member1.save()

member2 = Member.new({
    "first_name" => "Vladimir",
    "last_name" => "Putin",
    "age" => 67

})

member2.save()

member3 = Member.new({
    "first_name" => "Barack",
    "last_name" => "Obama",
    "age" => 58
})

member3.save()