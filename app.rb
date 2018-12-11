require './environment'

module FormsLab
  class App < Sinatra::Base
set :views, './views/pirates'

    get '/' do
      erb :root
    end

    get '/new' do
      erb :new
    end

    post '/pirates' do
      name = params[:pirate][:name]
      weight = params[:pirate][:weight]
      height = params[:pirate][:height]

      @pirate = Pirate.new(name,weight,height)

      params[:pirate][:ships].each do |ship|
        name = ship[:name]
        type = ship[:type]
        booty = ship[:booty]
        Ship.new(name,type,booty)
      end
      @ships = Ship.all
      erb :show
    end
  end
end
