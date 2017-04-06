defmodule Manhwastore.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end
    create index(:categories, [:category_id])

  end
end
