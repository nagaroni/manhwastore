defmodule Manhwastore.SupplierControllerTest do
  use Manhwastore.ConnCase

  alias Manhwastore.Supplier
  @valid_attrs %{cpf_cnpj: "some content", name: "some content", supplier_code: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, supplier_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing suppliers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, supplier_path(conn, :new)
    assert html_response(conn, 200) =~ "New supplier"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, supplier_path(conn, :create), supplier: @valid_attrs
    assert redirected_to(conn) == supplier_path(conn, :index)
    assert Repo.get_by(Supplier, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, supplier_path(conn, :create), supplier: @invalid_attrs
    assert html_response(conn, 200) =~ "New supplier"
  end

  test "shows chosen resource", %{conn: conn} do
    supplier = Repo.insert! %Supplier{}
    conn = get conn, supplier_path(conn, :show, supplier)
    assert html_response(conn, 200) =~ "Show supplier"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, supplier_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    supplier = Repo.insert! %Supplier{}
    conn = get conn, supplier_path(conn, :edit, supplier)
    assert html_response(conn, 200) =~ "Edit supplier"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    supplier = Repo.insert! %Supplier{}
    conn = put conn, supplier_path(conn, :update, supplier), supplier: @valid_attrs
    assert redirected_to(conn) == supplier_path(conn, :show, supplier)
    assert Repo.get_by(Supplier, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    supplier = Repo.insert! %Supplier{}
    conn = put conn, supplier_path(conn, :update, supplier), supplier: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit supplier"
  end

  test "deletes chosen resource", %{conn: conn} do
    supplier = Repo.insert! %Supplier{}
    conn = delete conn, supplier_path(conn, :delete, supplier)
    assert redirected_to(conn) == supplier_path(conn, :index)
    refute Repo.get(Supplier, supplier.id)
  end
end
