defmodule PhoenixElmStarterWeb.Schema do
  use Absinthe.Schema
  import_types PhoenixElmStarterWeb.Schema.Types
  alias PhoenixElmStarterWeb.MemberResolver

  query do
    # field :current_member, :member do
    #   resolve &MemberResolver.current_member/3
    # end

    field :signin, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &MemberResolver.sign_in/3
    end
  end

end
