require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

# Show all members

get '/members' do
    @members = Member.all()
    erb(:"members/index")
end

# new
get '/members/new' do
    erb(:"members/new")
end

# Show
get '/members/:id' do
    @members = Member.find(params['id'].to_i)
    erb(:"members/show")
end


# create
post '/members' do
    @member = Member.new(params)
    @member.save()
    erb(:"members/create")
end

# Edit
get '/members/:id/edit' do
    @member = Member.find(params['id'].to_i)
    erb(:"members/edit")
end

# Update
post '/members/:id' do
    member = Member.new(params)
    member.update()
    redirect to "/members/#{params['id']}"
end


# Delete

post '/members/:id/delete' do
    member = Member.find_by_id(params['id'].to_i)
    member.delete_bookings()
    member.delete()
    redirect to "/members"
end

# show all bookings for a member

get '/members/:id/bookings' do
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/bookings")
end