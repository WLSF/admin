defmodule Admin.Sales.Registry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "registries" do
    timestamps()

    belongs_to :product, Stores.Product
  end
end

defimpl Validations, for: Admin.Sales.Registry do
  import Ecto.Changeset

  def changeset(registry, attrs) do
    registry
    |> cast(attrs, [:product_id])
    |> validate_required(:product_id)
    |> foreign_key_constraint(:product_id)
  end
end
