defmodule Frombanua.Borneo do
  @moduledoc """
  Context module for handling Borneo items data.
  """

  @data_path Path.join(:code.priv_dir(:frombanua), "../lib/frombanua/data/borneo_data.json")

  @doc """
  Loads all items from the JSON file.
  """
  def list_items do
    @data_path
    |> File.read!()
    |> Jason.decode!(keys: :atoms)
    |> Map.get(:items)
  end

  @doc """
  Loads all items and applies filtering by category if provided.
  """
  def list_items(filters) do
    items = list_items()

    items
    |> filter_by_category(filters[:category])
    |> filter_by_search(filters[:search])
    |> sort_by(filters[:sort_by] || :votes)
  end

  @doc """
  Gets a single item by its id.
  """
  def get_item(id) when is_integer(id) do
    list_items()
    |> Enum.find(fn item -> item.id == id end)
  end

  def get_item(id) when is_binary(id) do
    id
    |> String.to_integer()
    |> get_item()
  rescue
    _ -> nil
  end

  defp filter_by_category(items, nil), do: items
  defp filter_by_category(items, category) when is_binary(category) do
    Enum.filter(items, fn item -> item.category == category end)
  end

  defp filter_by_search(items, nil), do: items
  defp filter_by_search(items, search) when is_binary(search) do
    search = String.downcase(search)
    
    Enum.filter(items, fn item ->
      String.contains?(String.downcase(item.name), search) ||
      String.contains?(String.downcase(item.description), search) ||
      String.contains?(String.downcase(item.location), search) ||
      Enum.any?(item.tags, fn tag -> String.contains?(String.downcase(tag), search) end)
    end)
  end

  defp sort_by(items, :votes) do
    Enum.sort_by(items, & &1.votes, :desc)
  end

  defp sort_by(items, :newest) do
    Enum.sort_by(items, & &1.founded_at, :desc)
  end

  defp sort_by(items, :name) do
    Enum.sort_by(items, & &1.name)
  end
end