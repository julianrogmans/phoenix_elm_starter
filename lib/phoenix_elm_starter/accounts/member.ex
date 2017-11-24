defmodule PhoenixElmStarter.Accounts.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixElmStarter.Accounts.Member


  schema "members" do
    field :email, :string
    field :encrypted_password, :string
    field :first_name, :string
    field :last_name, :string
    field :last_sign_in, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(%Member{} = member, attrs) do
    member
    |> cast(attrs, [:first_name, :last_name, :email, :encrypted_password, :last_sign_in])
    |> validate_required([:first_name, :last_name, :email, :encrypted_password, :last_sign_in])
  end
end
