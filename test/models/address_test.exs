defmodule Manhwastore.AddressTest do
  use Manhwastore.ModelCase

  alias Manhwastore.Address

  @valid_attrs %{city_name: "some content", name: "some content", neighboorhood_name: "some content", neighborhood_code: "some content", neighborhood_name: "some content", number: "some content", state_code: "some content", state_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Address.changeset(%Address{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Address.changeset(%Address{}, @invalid_attrs)
    refute changeset.valid?
  end
end
