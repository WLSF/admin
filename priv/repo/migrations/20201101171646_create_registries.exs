defmodule Admin.Repo.Migrations.CreateRegistries do
  use Ecto.Migration

  def change do
    create table(:registries) do
      add :product_id, references(:products, on_delete: :delete_all)

      timestamps()
    end

    create index(:registries, [:product_id])
  end
end
