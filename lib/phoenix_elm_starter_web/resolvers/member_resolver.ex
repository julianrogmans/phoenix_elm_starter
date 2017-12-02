defmodule PhoenixElmStarterWeb.MemberResolver do
  alias PhoenixElmStarter.Accounts
  alias PhoenixElmStarter.Accounts.Member
  alias PhoenixElmStarterWeb.Session

  def register(_parent, args, _context) do
    case Accounts.create_member(args) do
      {:ok, member} ->
        authentication_response member
      {:error, errors} ->
        {:error, %{
          message: "Something went wrong",
          errors: error_response errors
        }}
    end
  end

  def login(_parent, args, _context) do
    case Session.authenticate(args) do
      {:ok, member} ->
        authentication_response member
      :error ->
        {:error, "Could not find Member"}
    end
  end

  defp authentication_response(%Member{} = member) do
    {:ok, token, _full_claims} = member
      |> PhoenixElmStarterWeb.Guardian.encode_and_sign

    {:ok, %{
      member: member,
      token: token
    }}
  end

  defp error_response(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
