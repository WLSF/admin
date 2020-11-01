defmodule Admin.SalesTest do
  use Admin.DataCase

  alias Admin.Sales

  describe "registries" do
    alias Admin.Sales.Registry

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def registry_fixture(attrs \\ %{}) do
      {:ok, registry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_registry()

      registry
    end

    test "list_registries/0 returns all registries" do
      registry = registry_fixture()
      assert Sales.list_registries() == [registry]
    end

    test "get_registry!/1 returns the registry with given id" do
      registry = registry_fixture()
      assert Sales.get_registry!(registry.id) == registry
    end

    test "create_registry/1 with valid data creates a registry" do
      assert {:ok, %Registry{} = registry} = Sales.create_registry(@valid_attrs)
    end

    test "create_registry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_registry(@invalid_attrs)
    end

    test "update_registry/2 with valid data updates the registry" do
      registry = registry_fixture()
      assert {:ok, %Registry{} = registry} = Sales.update_registry(registry, @update_attrs)
    end

    test "update_registry/2 with invalid data returns error changeset" do
      registry = registry_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_registry(registry, @invalid_attrs)
      assert registry == Sales.get_registry!(registry.id)
    end

    test "delete_registry/1 deletes the registry" do
      registry = registry_fixture()
      assert {:ok, %Registry{}} = Sales.delete_registry(registry)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_registry!(registry.id) end
    end

    test "change_registry/1 returns a registry changeset" do
      registry = registry_fixture()
      assert %Ecto.Changeset{} = Sales.change_registry(registry)
    end
  end
end
