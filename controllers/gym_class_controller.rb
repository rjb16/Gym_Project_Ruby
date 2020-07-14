require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gym_class.rb' )
also_reload( '../models/*' )

get '/gym_classes' do
    @gym_classes = Gym_class.all()
    erb ( :"gym_classes/index")
end


# create

post '/classes' do
    @gym_class = Gym_class.new(params)
    @gym_class.save()
    redirect to "/classes"
end

# edit

get '/classes/:id/edit' do
    @gym_class = Gym_class.find(params['id'].to_i)
    erb(:"gym_classes/edit")
end

# update

post '/classes/:id' do
    gym_class = Gym_class.new(params)
    gym_class.update()
    redirect to "/classes/#{params['id']}"
end

# delete

post '/classes/:id/delete' do
    gym_class = Gym_class.find(params['id'].to_i)
    gym_class.delete_members()
    gym_class.delete()
    redirect to "/classes"
end

