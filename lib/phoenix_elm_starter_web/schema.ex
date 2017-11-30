defmodule PhoenixElmStarterWeb.Schema do
  use Absinthe.Schema
  import_types PhoenixElmStarterWeb.Schema.Types
  alias PhoenixElmStarterWeb.MemberResolver

  query do
    field :signin, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &MemberResolver.sign_in/3
    end
  end

  mutation do
    field :register, :session do
      arg :first_name, non_null(:string)
      arg :last_name, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      arg :password_confirmation, non_null(:string)
      resolve &MemberResolver.register/3
    end
  end

end
