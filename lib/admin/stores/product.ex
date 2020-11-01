defmodule Admin.Stores.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string

    timestamps()
  end
end

defimpl Validations, for: Admin.Stores.Product do
  import Ecto.Changeset

  @fields ~w(name)a

  def changeset(product, attrs) do
    product
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
