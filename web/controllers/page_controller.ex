defmodule Manhwastore.PageController do
  use Manhwastore.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
