defmodule PhoenixElmStarterWeb.Session do
  alias PhoenixElmStarter.Accounts

  def authenticate(%{email: e, password: p}) do
    case Accounts.find_member(%{email: e}) do
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

  def get_context(resolution, _) do
    with %{value: %{token: token}} <- resolution do
      Map.update!(resolution, :context, fn ctx ->
        Map.put(ctx, :auth_token, token)
      end)
    end
  end

  defp verify_password(password, pw_hash) do
    Comeonin.Bcrypt.checkpw(password, pw_hash)
  end
end
