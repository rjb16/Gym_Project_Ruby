require_relative("../models/booking.rb")
require_relative("../models/gym_class.rb")
require_relative("../models/member.rb")
require("pry-byebug")

Booking.delete_all()
Member.delete_all()
Gym_class.delete_all()

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

member4 = Member.new ({
    "first_name" => "Tom",
    "last_name" => "Hanks",
    "age" => 64
})

member4.save()


gym_class1 = Gym_class.new({
    "name" => "HIIT",
    "date" => "17th of July",
    "price" => 5
})
gym_class1.save()

gym_class2 = Gym_class.new({
    "name" => "beginners powerlifting",
    "date" => "20th of July",
    "price" => 10
})

gym_class2.save()

gym_class3 = Gym_class.new({
    "name" => "boxing",
    "date" => "21st of July",
    "price" => 15
})
gym_class3.save()

booking1 = Booking.new({
    "member_id" => member1.id,
    "gym_class_id" => gym_class1.id
})

booking1.save()

binding.pry
nil
