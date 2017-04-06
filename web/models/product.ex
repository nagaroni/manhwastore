defmodule Manhwastore.Product do
  use Manhwastore.Web, :model

  schema "products" do
    field :price, :decimal
    field :title, :string
    field :volume, :string
    field :quantity, :integer
    field :image_url, :string
    field :video_url, :string
    field :download_url, :string
    belongs_to :category, Manhwastore.Category
    belongs_to :supplier, Manhwastore.Supplier

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:price, :title, :volume, :quantity, :image_url, :video_url, :download_url])
    |> validate_required([:price, :title, :volume, :quantity])
  end
end
