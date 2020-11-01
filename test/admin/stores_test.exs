defmodule Admin.StoresTest do
  use Admin.DataCase

  alias Admin.Stores

  describe "products" do
    alias Admin.Stores.Product

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stores.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Stores.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Stores.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Stores.create_product(@valid_attrs)
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stores.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Stores.update_product(product, @update_attrs)
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Stores.update_product(product, @invalid_attrs)
      assert product == Stores.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Stores.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Stores.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Stores.change_product(product)
    end
  end
end
