class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    # bird = Bird.create(name: params[:name], species: params[:species])
    bird = Bird.create(params.permit(:name, :species))
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

#   You can disable the wrap parameters feature in an individual controller:

# class BirdsController < ApplicationController
#   wrap_parameters format: []
# end
# You can also disable it for all controllers if you like, by going into the config/initializers/wrap_parameters.rb file and updating it like so:

# ActiveSupport.on_load(:action_controller) do
#   wrap_parameters format: []
# end

  private 
  def bird_params
    params.permit(:name, :species)
  end
end
