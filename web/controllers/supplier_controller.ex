defmodule Manhwastore.SupplierController do
  use Manhwastore.Web, :controller

  alias Manhwastore.Supplier

  def index(conn, _params) do
    suppliers = Repo.all(Supplier)
    render(conn, "index.html", suppliers: suppliers)
  end

  def new(conn, _params) do
    changeset = Supplier.changeset(%Supplier{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"supplier" => supplier_params}) do
    changeset = Supplier.changeset(%Supplier{}, supplier_params)

    case Repo.insert(changeset) do
      {:ok, _supplier} ->
        conn
        |> put_flash(:info, "Supplier created successfully.")
        |> redirect(to: supplier_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    supplier = Repo.get!(Supplier, id)
    render(conn, "show.html", supplier: supplier)
  end

  def edit(conn, %{"id" => id}) do
    supplier = Repo.get!(Supplier, id)
    changeset = Supplier.changeset(supplier)
    render(conn, "edit.html", supplier: supplier, changeset: changeset)
  end

  def update(conn, %{"id" => id, "supplier" => supplier_params}) do
    supplier = Repo.get!(Supplier, id)
    changeset = Supplier.changeset(supplier, supplier_params)

    case Repo.update(changeset) do
      {:ok, supplier} ->
        conn
        |> put_flash(:info, "Supplier updated successfully.")
        |> redirect(to: supplier_path(conn, :show, supplier))
      {:error, changeset} ->
        render(conn, "edit.html", supplier: supplier, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    supplier = Repo.get!(Supplier, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(supplier)

    conn
    |> put_flash(:info, "Supplier deleted successfully.")
    |> redirect(to: supplier_path(conn, :index))
  end
end
