require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gym_class.rb' )
also_reload( '../models/*' )

get '/gym_classes' do
    @gym_class = Gym_class.all()
    erb ( :"gym_classes/index")
end