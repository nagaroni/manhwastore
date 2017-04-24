defmodule Product.Factory do
  use ExMachina.Ecto, repo: Manhwastore.Repo
  alias Manhwastore.Product

  def product_factory do
    %Product{title: "Magi the kingdom of magic",
             price: 18.00, description: "Magi"}
  end
end

