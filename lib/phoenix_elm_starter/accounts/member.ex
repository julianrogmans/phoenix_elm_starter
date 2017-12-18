defmodule PhoenixElmStarter.Accounts.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixElmStarter.Accounts
  alias PhoenixElmStarter.Accounts.Member


  schema "members" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :encrypted_password, :string
    field :first_name, :string
    field :last_name, :string
    field :last_sign_in, :utc_datetime

    timestamps()
  end

  @doc false
  def register_changeset(%Member{} = member, attrs) do
    member
    |> cast(attrs, [
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :encrypted_password,
        :last_sign_in
      ])
    |> validate_confirmation(:password)
    |> put_pass_hash
    |> set_last_sign_in
    |> validate_required([:first_name, :last_name, :email, :encrypted_password, :last_sign_in])
  end

  defp set_last_sign_in(changeset) do
    change(changeset, %{last_sign_in: DateTime.utc_now})
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes:
      %{password: password}} = changeset) do
    change(changeset, %{password_confirmation: nil})
    |> change(Comeonin.Bcrypt.add_hash(password, hash_key: :encrypted_password))
  end
  defp put_pass_hash(changeset), do: changeset

  def verify(%{password: password} = attrs) do
    case Accounts.find_member(attrs) do
      nil -> {:error, "Can't find member"}
      %Member{} = member ->
        member |> Comeonin.Bcrypt.check_pass(password)
    end
  end

end
