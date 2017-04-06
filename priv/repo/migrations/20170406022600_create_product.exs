defmodule Manhwastore.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :price, :decimal
      add :title, :string
      add :volume, :string
      add :quantity, :integer
      add :image_url, :string
      add :video_url, :string
      add :download_url, :string
      add :category_id, references(:categories, on_delete: :nothing)
      add :supplier_id, references(:suppliers, on_delete: :nothing)

      timestamps()
    end
    create index(:products, [:category_id])
    create index(:products, [:supplier_id])

  end
end
