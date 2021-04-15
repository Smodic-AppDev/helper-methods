class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def show
    
    @director = Director.find(params.fetch(:id))

  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob, :bio)
    @director = Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to movies_url, notice: "Director created successfully."
    else
      render "new" # matches controller name but doesn't match action so tempalte name is needed
    end
  end

  def edit
    @director = Director.find(params.fetch(:id))
  end

  def update
    
    
    @director = Director.find(params.fetch(:id))

    @director.name = params.fetch(:name)
    @director.dob = params.fetch(:dob)
    @director.bio = params.fetch(:bio)
    #director_attributes = params.require(:director).permit(:name, :dob, :bio )
    #@director = @director.update(director_attributes)


    if @director.valid?
      @director.save
      redirect_to(director_url(@director),  notice: "Director updated successfully." )
    else
      redirect_to(director_url(@director),  alert: "Director failed to update successfully." )
    end
  end

  def destroy
    @director = Director.find(params.fetch(:id))

    @director.destroy

    redirect_to(movies_url,  notice: "Director deleted successfully." )
  end

end