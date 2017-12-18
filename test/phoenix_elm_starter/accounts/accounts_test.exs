defmodule PhoenixElmStarter.AccountsTest do
  use PhoenixElmStarter.DataCase

  alias PhoenixElmStarter.Accounts

  describe "members" do
    alias PhoenixElmStarter.Accounts.Member

    @valid_attrs %{email: "some email", encrypted_password: "some encrypted_password", first_name: "some first_name", last_name: "some last_name", last_sign_in: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{email: "some updated email", encrypted_password: "some updated encrypted_password", first_name: "some updated first_name", last_name: "some updated last_name", last_sign_in: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{email: nil, encrypted_password: nil, first_name: nil, last_name: nil, last_sign_in: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Accounts.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Accounts.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Accounts.create_member(@valid_attrs)
      assert member.email == "some email"
      assert member.encrypted_password == "some encrypted_password"
      assert member.first_name == "some first_name"
      assert member.last_name == "some last_name"
      assert member.last_sign_in == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, member} = Accounts.update_member(member, @update_attrs)
      assert %Member{} = member
      assert member.email == "some updated email"
      assert member.encrypted_password == "some updated encrypted_password"
      assert member.first_name == "some updated first_name"
      assert member.last_name == "some updated last_name"
      assert member.last_sign_in == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_member(member, @invalid_attrs)
      assert member == Accounts.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Accounts.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Accounts.change_member(member)
    end
  end
end
