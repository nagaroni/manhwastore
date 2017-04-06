defmodule Manhwastore.PageController do
  use Manhwastore.Web, :controller
  alias Manhwastore.Product

  def index(conn, _params) do
    products = Repo.all(Product)
    render(conn, "index.html", products: products)
  end
end
