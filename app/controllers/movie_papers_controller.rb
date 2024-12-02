class MoviePapersController < ApplicationController
  def new
    @actor = Actor.find(params[:actor_id])
    @movie_paper = MoviePaper.new
    @movies = Movie.all
  end

  def create
    movie_paper_params = params.require(:movie_paper).permit(:movie_id, :character_name)
    @actor = Actor.find(params[:actor_id])
    @movie_paper = MoviePaper.new(movie_paper_params)
    @movie_paper.actor = @actor

    if @movie_paper.save
      redirect_to @actor, notice: t('.success')
    else
      @movies = Movie.all
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end
end