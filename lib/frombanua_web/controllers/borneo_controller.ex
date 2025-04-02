defmodule FrombanuaWeb.BorneoController do
  use FrombanuaWeb, :controller

  alias Frombanua.Borneo

  def index(conn, params) do
    items = Borneo.list_items(%{
      category: params["category"],
      search: params["search"], 
      sort_by: parse_sort(params["sort_by"])
    })

    render(conn, :index, items: items)
  end

  def show(conn, %{"id" => id}) do
    case Borneo.get_item(id) do
      nil ->
        conn
        |> put_flash(:error, "Item tidak ditemukan")
        |> redirect(to: ~p"/")

      item ->
        render(conn, :show, item: item)
    end
  end

  def by_category(conn, %{"category" => category}) do
    items = Borneo.list_items(%{category: category})
    render(conn, :index, items: items, active_category: category)
  end

  defp parse_sort("votes"), do: :votes
  defp parse_sort("newest"), do: :newest
  defp parse_sort("name"), do: :name
  defp parse_sort(_), do: :votes
end