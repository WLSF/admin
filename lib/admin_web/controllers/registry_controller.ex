defmodule AdminWeb.RegistryController do
  use AdminWeb, :controller

  alias Admin.Sales
  alias Admin.Sales.Registry

  def index(conn, _params) do
    registries = Sales.list_registries()
    render(conn, "index.html", registries: registries)
  end

  def new(conn, _params) do
    changeset = Sales.change_registry(%Registry{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"registry" => registry_params}) do
    case Sales.create_registry(registry_params) do
      {:ok, registry} ->
        conn
        |> put_flash(:info, "Registry created successfully.")
        |> redirect(to: Routes.registry_path(conn, :show, registry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    registry = Sales.get_registry!(id)
    render(conn, "show.html", registry: registry)
  end

  def edit(conn, %{"id" => id}) do
    registry = Sales.get_registry!(id)
    changeset = Sales.change_registry(registry)
    render(conn, "edit.html", registry: registry, changeset: changeset)
  end

  def update(conn, %{"id" => id, "registry" => registry_params}) do
    registry = Sales.get_registry!(id)

    case Sales.update_registry(registry, registry_params) do
      {:ok, registry} ->
        conn
        |> put_flash(:info, "Registry updated successfully.")
        |> redirect(to: Routes.registry_path(conn, :show, registry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", registry: registry, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    registry = Sales.get_registry!(id)
    {:ok, _registry} = Sales.delete_registry(registry)

    conn
    |> put_flash(:info, "Registry deleted successfully.")
    |> redirect(to: Routes.registry_path(conn, :index))
  end
end
