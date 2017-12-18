defmodule PhoenixElmStarterWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :member do
    field :id, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :last_sign_in, :string
  end

  object :session do
    field :member, :member
    field :token, :string
  end
end
