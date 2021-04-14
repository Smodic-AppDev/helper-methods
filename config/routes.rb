Rails.application.routes.draw do
  #ORIGINAL get("/", { :controller => "movies", :action => "index" })
  #SIMPLIFIED get "/", controller: "movies", action: "index"
  #MOST SIMPLIFIED
  #get "/" => "movies#index"
  #SPECIAL FOR ROOT
  root "movies#index"
  
  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies # movies_url and movies_path
  get "/movies/new" => "movies#new", as: :new_movie # new_movie_url and new_movie_path
          
  # READ
  get "/movies" => "movies#index" #already named above
  get "/movies/:id" => "movies#show", as: :movie # movie_url and movie_path (expects an argument for ID segment)
  
  # UPDATE
  patch "/movies/:id" => "movies#update" #already named above
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie # edit_movie_url and edit_movie_path (expects an argument for ID segment)
  
  # DELETE
  delete "/movies/:id" => "movies#destroy" #already named above

  #------------------------------
end