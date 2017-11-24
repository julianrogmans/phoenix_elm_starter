defmodule PhoenixElmStarterWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :member do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :last_sign_in, :string
  end

  object :member_signin do
    field :member, :member
    field :token, :string
  end
end
