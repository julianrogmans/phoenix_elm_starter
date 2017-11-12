defmodule PhoenixElmStarterWeb.Schema do
  use Absinthe.Schema
  import_types PhoenixElmStarterWeb.Schema.Types

  query do
    field :test, :test do
      resolve fn(_parent, _args, _context) -> {:ok, %{hello: "world"}} end
    end
  end

end
