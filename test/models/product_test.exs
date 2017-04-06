defmodule Manhwastore.ProductTest do
  use Manhwastore.ModelCase

  alias Manhwastore.Product

  @valid_attrs %{download_url: "some content", image_url: "some content", price: "120.5", quantity: 42, title: "some content", video_url: "some content", volume: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
