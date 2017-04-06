defmodule Manhwastore.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :name, :string
      add :number, :string
      add :state_name, :string
      add :city_name, :string
      add :state_code, :string
      add :neighboorhood_name, :string
      add :neighborhood_name, :string
      add :neighborhood_code, :string

      timestamps()
    end

  end
end
