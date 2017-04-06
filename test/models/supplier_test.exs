defmodule Manhwastore.SupplierTest do
  use Manhwastore.ModelCase

  alias Manhwastore.Supplier

  @valid_attrs %{cpf_cnpj: "some content", name: "some content", supplier_code: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Supplier.changeset(%Supplier{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Supplier.changeset(%Supplier{}, @invalid_attrs)
    refute changeset.valid?
  end
end
