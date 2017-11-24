defmodule PhoenixElmStarterWeb.MemberResolver do
  alias PhoenixElmStarterWeb.Accounts
  def sign_in(_parent, args, _context) do
    case PhoenixElmStarterWeb.Session.authenticate(args) do
      {:ok, member} ->
        {:ok, jwt, _full_claims} = member
          |> Guardian.encode_and_sign(:token)
        {:ok, %{
          member: member,
          token: jwt
        }}
    end
  end
end
