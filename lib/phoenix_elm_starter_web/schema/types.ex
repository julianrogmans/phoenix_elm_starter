defmodule PhoenixElmStarterWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :test do
    field :hello, :string
  end
end
