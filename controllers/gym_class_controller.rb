require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gym_class.rb')
also_reload( '../models/*' )

get '/gym_classes' do
    @gym_classes = Gym_class.all()
    erb ( :"gym_classes/index")
end


# create

post '/gym_classes' do
    @gym_class = Gym_class.new(params)
    @gym_class.save()
    redirect to "/gym_classes"
end

# edit

get '/gym_classes/:id/edit' do
    @gym_class = Gym_class.find(params[:id].to_i)
    erb(:"gym_classes/edit")
end

# update

post '/gym_classes/:id' do
    gym_class = Gym_class.new(params)
    gym_class.update()
    redirect to "/gym_classes"
end

# delete

post '/gym_classes/:id/delete' do
    gym_class = Gym_class.find(params['id'].to_i)
    gym_class.delete()
    redirect to "/gym_classes"
end


# new
get '/classes/new' do
    erb(:"gym_classes/new")
    
end