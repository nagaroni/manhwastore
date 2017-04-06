defmodule Manhwastore.Supplier do
  use Manhwastore.Web, :model

  schema "suppliers" do
    field :name, :string
    field :supplier_code, :integer
    field :cpf_cnpj, :string
    belongs_to :address, Manhwastore.Address

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :supplier_code, :cpf_cnpj])
    |> validate_required([:name, :supplier_code, :cpf_cnpj])
  end
end
