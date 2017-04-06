defmodule Manhwastore.Repo.Migrations.CreateSupplier do
  use Ecto.Migration

  def change do
    create table(:suppliers) do
      add :name, :string
      add :supplier_code, :integer
      add :cpf_cnpj, :string
      add :address_id, references(:addresses, on_delete: :nothing)

      timestamps()
    end
    create index(:suppliers, [:address_id])

  end
end
