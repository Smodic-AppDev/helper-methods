class MoviesController < ApplicationController
  def new
    @movie = Movie.new

    #render template: "movies/new.html.erb" Not needed based on Rails assumptions
  end

  def index

    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html
        #render template: "movies/index.html.erb"  Not needed based on Rails assumptions
      end
  end

  def show
    # @movie = Movie.where(id: params.fetch(:id)).first    replaced by below
    # @movie = Movie.find_by(id: params.fetch(:id))
    @movie = Movie.find(params.fetch(:id))
    
    the_id = params.fetch(:id)

    matching_movies = Movie.where( id: the_id )

    @movie = matching_movies.first

    #render template: "movies/show.html.erb"  Not needed based on Rails assumptions
  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch(:movie).fetch(:title)
    @movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully."
    else
      render "new" # matches controller name but doesn't match action so tempalte name is needed
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))

    #render template: "movies/edit.html.erb"  Not needed based on Rails assumptions
  end

  def update
    @movie = Movie.find(params.fetch(:id))

    @movie.title = params.fetch(:title)
    @movie.description = params.fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to(movie_url(@movie),  notice: "Movie updated successfully." )
    else
      redirect_to(movie_url(@movie),  alert: "Movie failed to update successfully." )
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to(movies_url,  notice: "Movie deleted successfully." )
  end
end
