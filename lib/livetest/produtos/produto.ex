defmodule Livetest.Produtos.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :nome, :string
    field :preco, :string
    field :sku, :string

    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:nome, :sku, :preco])
    |> validate_required([:nome, :sku, :preco])
  end
end
