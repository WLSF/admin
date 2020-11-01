defmodule AdminWeb.RegistryControllerTest do
  use AdminWeb.ConnCase

  alias Admin.Sales

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:registry) do
    {:ok, registry} = Sales.create_registry(@create_attrs)
    registry
  end

  describe "index" do
    test "lists all registries", %{conn: conn} do
      conn = get(conn, Routes.registry_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Registries"
    end
  end

  describe "new registry" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.registry_path(conn, :new))
      assert html_response(conn, 200) =~ "New Registry"
    end
  end

  describe "create registry" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.registry_path(conn, :create), registry: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.registry_path(conn, :show, id)

      conn = get(conn, Routes.registry_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Registry"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.registry_path(conn, :create), registry: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Registry"
    end
  end

  describe "edit registry" do
    setup [:create_registry]

    test "renders form for editing chosen registry", %{conn: conn, registry: registry} do
      conn = get(conn, Routes.registry_path(conn, :edit, registry))
      assert html_response(conn, 200) =~ "Edit Registry"
    end
  end

  describe "update registry" do
    setup [:create_registry]

    test "redirects when data is valid", %{conn: conn, registry: registry} do
      conn = put(conn, Routes.registry_path(conn, :update, registry), registry: @update_attrs)
      assert redirected_to(conn) == Routes.registry_path(conn, :show, registry)

      conn = get(conn, Routes.registry_path(conn, :show, registry))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, registry: registry} do
      conn = put(conn, Routes.registry_path(conn, :update, registry), registry: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Registry"
    end
  end

  describe "delete registry" do
    setup [:create_registry]

    test "deletes chosen registry", %{conn: conn, registry: registry} do
      conn = delete(conn, Routes.registry_path(conn, :delete, registry))
      assert redirected_to(conn) == Routes.registry_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.registry_path(conn, :show, registry))
      end
    end
  end

  defp create_registry(_) do
    registry = fixture(:registry)
    %{registry: registry}
  end
end
