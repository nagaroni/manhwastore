defmodule Manhwastore.Address do
  use Manhwastore.Web, :model

  schema "addresses" do
    field :name, :string
    field :number, :string
    field :state_name, :string
    field :city_name, :string
    field :state_code, :string
    field :neighboorhood_name, :string
    field :neighborhood_name, :string
    field :neighborhood_code, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :number, :state_name, :city_name, :state_code, :neighboorhood_name, :neighborhood_name, :neighborhood_code])
    |> validate_required([:name, :number, :state_name, :city_name, :state_code, :neighboorhood_name, :neighborhood_name, :neighborhood_code])
  end
end
