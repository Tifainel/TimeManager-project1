defmodule SrcWeb.Router do
  use SrcWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/", SrcWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", SrcWeb do
    pipe_through :api

    #
    #  CUSTOM ROUTES
    #
    #  TYPE   #PATH                   #CONTROLLER        #FUNCTION
    #  get    "/clocks/:user_id",     ClockController,   :show

    # -------------
    # CLOCKS
    # -------------
    #get by user id
    get "/clocks/:user_id", ClockController, :show

    #get last clock by user id
    get "/clocks/last/:user_id", ClockController, :get_last_by_user_id

    #create with user id and it works !
    post "/clocks/:user_id", ClockController, :create

    # -------------
    # WORKINGTIMES
    # -------------

    #get all (not lazy anymore, it works !)
    get "/workingtimes/:user_id", WorkingtimeController, :get_all

    #get one
    get "/workingtimes/:user_id/:id", WorkingtimeController, :get_one

    #create one (finaly, WORKING !)
    post "/workingtimes/:user_id", WorkingtimeController, :create

    #update
    put "/workingtimes/:id", WorkingtimeController, :update

    #delete
    delete "/workingtimes/:id", WorkingtimeController, :delete

    #get all (without id)
    get "/workingtimes", WorkingtimeController, :index

    # -------------
    # USERS
    # -------------


    # -------------
    # TEAMS
    # -------------

    #get all teams
    get "/teams/", TeamController, :index

    #get all user teams
    get "/teams/:user_id", TeamController, :get_all_by_user

    #get a team by user_id and team_id
    get "/teams/:user_id/:id", TeamController, :get_team

    #get a team by user_id and team_id
    get "/member_teams/:member_id", TeamController, :get_member_teams

    #put a team
    put "/teams/:id", TeamController, :update

    #delete a team
    delete "/teams/:id", TeamController, :delete

    #create a team
    post "/teams/", TeamController, :create



    #default
    resources "/users", UserController, except: [:new, :edit]
    # resources "/workingtimes", WorkingtimeController, except: [:new, :edit]
    # resources "/clocks", ClockController, except: [:new, :edit]
    # resources "/teams", TeamController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SrcWeb.Telemetry
    end
  end
end
