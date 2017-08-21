defmodule Manhwastore.Product do
  use Manhwastore.Web, :model

  @derive{Poison.Encoder, only: [:id, :title, :description, :price,
                                 :inserted_at, :updated_at]}

  schema "products" do
    field :title, :string
    field :description, :string
    field :price, :decimal

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :price])
    |> validate_required([:title, :description, :price])
  end
end
