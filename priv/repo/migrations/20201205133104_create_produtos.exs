defmodule Livetest.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :nome, :string
      add :sku, :string
      add :preco, :string

      timestamps()
    end

  end
end
