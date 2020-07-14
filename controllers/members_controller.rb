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