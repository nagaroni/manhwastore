defmodule Manhwastore.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :description, :text
      add :price, :decimal

      timestamps
    end
  end
end
