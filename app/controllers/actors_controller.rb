class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    actor_params = params.require(:actor).permit(:name, :date_of_birth, :nationality)
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to( @actor, notice: t('.success'))
    end
  end

  def show
    @actor = Actor.find(params[:id])
  end
end