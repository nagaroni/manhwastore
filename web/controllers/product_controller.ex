defmodule Manhwastore.ProductController do
  use Manhwastore.Web, :controller
  alias Manhwastore.Product
  alias Manhwastore.Repo

  def index(conn, _params) do
    products = Product |> Repo.all

    json(conn, %{products: products})
  end

  def show(conn, %{"id" => id}) do
    product = Repo.get(Product, id)

    json(conn, %{product: product})
  end

  def update(conn, %{"id" => id, "product" => attributes}) do
    product = Product |> Repo.get(id)
    product = Product.changeset(product, attributes)
    
    case Repo.update(product) do
      {:ok, struct} ->
        conn
        |> put_status(201)
        |> json(%{product: struct})
    end
  end

  def create(conn, params) do
    changeset = Product.changeset(%Product{}, params)

    case Repo.insert(changeset) do
      {:ok, product } ->

        conn
        |> put_status(201)
        |> json(%{product: product})
      {:error, product} ->
        errors =
          product.errors
          |> Enum.reduce(%{}, fn({key, {message, _}}, acc) -> Map.put(acc, key, message) end)

        conn
        |> put_status(422)
        |> json(%{errors: errors})
    end
  end
end
