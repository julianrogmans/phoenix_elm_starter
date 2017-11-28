defmodule PhoenixElmStarterWeb.MemberResolver do
  alias PhoenixElmStarterWeb.Accounts


  def sign_in(_parent, args, _context) do
    require IEx
    IEx.pry()
    case PhoenixElmStarterWeb.Session.authenticate(args) do
      {:ok, member} ->
        {:ok, jwt, _full_claims} = member
          |> Guardian.encode_and_sign(:token)
        {:ok, %{
          id: member.id,
          token: jwt
        }}
      :error ->
        {:error, %{
          message: "Could not find Member"
        }}
    end
  end
end
