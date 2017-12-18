defmodule PhoenixElmStarterWeb.Schema do
  use Absinthe.Schema
  import_types PhoenixElmStarterWeb.Schema.Types
  alias PhoenixElmStarterWeb.{Session, MemberResolver}

  query do
  end

  mutation do
    field :register, :session do
      arg :first_name, non_null(:string)
      arg :last_name, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      arg :password_confirmation, non_null(:string)
      middleware &Session.get_context/2
      resolve &MemberResolver.register/3
    end

    field :login, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      middleware &Session.get_context/2
      resolve &MemberResolver.login/3
    end
  end

end
