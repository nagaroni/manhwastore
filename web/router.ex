defmodule Manhwastore.Router do
  use Manhwastore.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Manhwastore do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Manhwastore do
    pipe_through :api

    resources "/products", ProductController, only: [:index, :create, :show]
  end
end
