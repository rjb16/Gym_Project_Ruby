require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/gym_class')
also_reload('../models/*')


#  index
get "/bookings" do
    @bookings = Booking.all()
    erb(:"bookings/index")
end

# new
get "/bookings/new" do
    @bookings = Booking.all()
    @members = Member.all()
    @gym_coasses = Gym_class.all()
    erb(:"bookings/new")
end


