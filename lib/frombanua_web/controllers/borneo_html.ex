defmodule FrombanuaWeb.BorneoHTML do
  use FrombanuaWeb, :html

  embed_templates "borneo_html/*"

  def format_vote_count(votes) when is_integer(votes) do
    cond do
      votes > 1_000_000 -> "#{Float.round(votes / 1_000_000, 1)}M"
      votes > 1_000 -> "#{Float.round(votes / 1_000, 1)}K"
      true -> to_string(votes)
    end
  end

  def category_name("usaha"), do: "Usaha Lokal"
  def category_name("organisasi"), do: "Organisasi"
  def category_name("perusahaan"), do: "Perusahaan"
  def category_name("tempat"), do: "Tempat"
  def category_name(_), do: "Tidak Dikategorikan"

  def category_emoji("usaha"), do: "🛍️"
  def category_emoji("organisasi"), do: "🤝"
  def category_emoji("perusahaan"), do: "🏢"
  def category_emoji("tempat"), do: "📍"
  def category_emoji(_), do: "❓"

  def category_color("usaha"), do: "bg-indigo-100 text-indigo-800"
  def category_color("organisasi"), do: "bg-green-100 text-green-800"
  def category_color("perusahaan"), do: "bg-blue-100 text-blue-800"
  def category_color("tempat"), do: "bg-rose-100 text-rose-800"
  def category_color(_), do: "bg-gray-100 text-gray-800"
end