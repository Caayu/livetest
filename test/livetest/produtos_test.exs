defmodule Livetest.ProdutosTest do
  use Livetest.DataCase

  alias Livetest.Produtos

  describe "produtos" do
    alias Livetest.Produtos.Produto

    @valid_attrs %{nome: "some nome", preco: "some preco", sku: "some sku"}
    @update_attrs %{nome: "some updated nome", preco: "some updated preco", sku: "some updated sku"}
    @invalid_attrs %{nome: nil, preco: nil, sku: nil}

    def produto_fixture(attrs \\ %{}) do
      {:ok, produto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Produtos.create_produto()

      produto
    end

    test "list_produtos/0 returns all produtos" do
      produto = produto_fixture()
      assert Produtos.list_produtos() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Produtos.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      assert {:ok, %Produto{} = produto} = Produtos.create_produto(@valid_attrs)
      assert produto.nome == "some nome"
      assert produto.preco == "some preco"
      assert produto.sku == "some sku"
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Produtos.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{} = produto} = Produtos.update_produto(produto, @update_attrs)
      assert produto.nome == "some updated nome"
      assert produto.preco == "some updated preco"
      assert produto.sku == "some updated sku"
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Produtos.update_produto(produto, @invalid_attrs)
      assert produto == Produtos.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Produtos.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Produtos.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Produtos.change_produto(produto)
    end
  end
end
