defmodule LivetestWeb.ProdutoLive.Index do
  use LivetestWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :produtos, todos()), temporary_assigns: [produtos: []]}
  end

  defp apply_action(socket, :index, _) do
    IO.inspect "index"
    IO.inspect socket
    socket
    |> assign(:page_title, "Lista de produtos")
    |> assign(:produtos, nil)
  end

  def todos(), do: Livetest.Produtos.list_produtos
end
