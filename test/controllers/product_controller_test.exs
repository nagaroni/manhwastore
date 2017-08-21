defmodule Manhwastore.ProductControllerTest do
  use Manhwastore.ConnCase
  alias Manhwastore.Repo
  alias Manhwastore.Product

  test "#index renders a list of products" do
    conn = build_conn()
    product = insert(:product)

    conn = get(conn, product_path(conn, :index))

    assert(json_response(conn, 200) == %{
      "products" => [%{
        "title" => product.title,
        "price" => to_string(product.price),
        "description" => product.description,
        "inserted_at" => NaiveDateTime.to_iso8601(product.inserted_at),
        "updated_at" => NaiveDateTime.to_iso8601(product.updated_at),
        "id" => product.id
      }]
    })
  end

  test "#create should create a new product" do
    conn = build_conn()
    product_params = params_for(:product)

    conn = post(conn, product_path(conn, :create), product_params)
    %{"product" => %{"id" => id}} = json_response(conn, 201)
    product = Product |> Ecto.Query.last |> Repo.one

    assert(id == product.id)
  end

  test "#create should respond with errors" do
    conn = build_conn()
    conn = post(conn, product_path(conn, :create), %{})
    errors = %{
      "errors" => %{
        "title" => "can't be blank",
        "description" => "can't be blank",
        "price" => "can't be blank"
      }
    }

    assert json_response(conn, 422) == errors
  end

  test "#show renders an specific product" do
    conn = build_conn()
    product = insert(:product)

    conn = get(conn, product_path(conn, :show, product.id))

    assert(json_response(conn, 200) == %{
      "product" => %{
        "title" => product.title,
        "price" => to_string(product.price),
        "description" => product.description,
        "inserted_at" => NaiveDateTime.to_iso8601(product.inserted_at),
        "updated_at" => NaiveDateTime.to_iso8601(product.updated_at),
        "id" => product.id
      }
    })
  end
end
