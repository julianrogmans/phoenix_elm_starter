defmodule PhoenixElmStarterWeb.Schema do
  use Absinthe.Schema
  import_types PhoenixElmStarterWeb.Schema.Types
  alias PhoenixElmStarterWeb.MemberResolver

  query do
    # field :current_member, :member do
    #   resolve &MemberResolver.current_member/3
    # end

    field :member_signin, :member_signin do
      arg :email, :string
      arg :password, :string
      resolve &MemberResolver.sign_in/3
    end
  end

end
