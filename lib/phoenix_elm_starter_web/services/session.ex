defmodule PhoenixElmStarterWeb.Session do
  alias PhoenixElmStarterWeb.Accounts
  alias PhoenixElmStarterWeb.Accounts.Member

  def authenticate(%{"email" => e, "password" => p}) do
    case Accounts.find_member(Member, email: e) do
      nil ->
        :error
      account ->
        case verify_password(p, account.encrypted_password) do
          true ->
            {:ok, account}
          _ ->
            :error
        end
    end
  end

  defp verify_password(password, pw_hash) do
    Comeonin.Bcrypt.checkpw(password, pw_hash)
  end
end
