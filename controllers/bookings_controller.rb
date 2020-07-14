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
    @gym_classes = Gym_class.all()
    erb(:"bookings/new")
end

# create

post '/bookings' do
    booking = Booking.new(params)
    booking.save()
    erb(:"bookings/create")

end

# Delete

post '/bookings/:id/delete' do
     booking = Booking.find(params['id'].to_i)
     booking.delete()
     redirect to "/bookings"
end


