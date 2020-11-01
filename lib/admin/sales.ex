defmodule Admin.Sales do
  @moduledoc """
  The Sales context.
  """

  import Ecto.Query, warn: false
  alias Admin.Repo

  alias Admin.Sales.Registry

  @doc """
  Returns the list of registries.

  ## Examples

      iex> list_registries()
      [%Registry{}, ...]

  """
  def list_registries do
    Repo.all(Registry)
  end

  @doc """
  Gets a single registry.

  Raises `Ecto.NoResultsError` if the Registry does not exist.

  ## Examples

      iex> get_registry!(123)
      %Registry{}

      iex> get_registry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_registry!(id), do: Repo.get!(Registry, id)

  @doc """
  Creates a registry.

  ## Examples

      iex> create_registry(%{field: value})
      {:ok, %Registry{}}

      iex> create_registry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_registry(attrs \\ %{}) do
    %Registry{}
    |> Validations.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a registry.

  ## Examples

      iex> update_registry(registry, %{field: new_value})
      {:ok, %Registry{}}

      iex> update_registry(registry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_registry(%Registry{} = registry, attrs) do
    registry
    |> Validations.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a registry.

  ## Examples

      iex> delete_registry(registry)
      {:ok, %Registry{}}

      iex> delete_registry(registry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_registry(%Registry{} = registry) do
    Repo.delete(registry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking registry changes.

  ## Examples

      iex> change_registry(registry)
      %Ecto.Changeset{data: %Registry{}}

  """
  def change_registry(%Registry{} = registry, attrs \\ %{}) do
    Validations.changeset(registry, attrs)
  end
end
