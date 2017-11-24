defmodule PhoenixElmStarterWeb.MemberView do
  use PhoenixElmStarterWeb, :view
  alias PhoenixElmStarterWeb.MemberView

  def render("index.json", %{members: members}) do
    %{data: render_many(members, MemberView, "member.json")}
  end

  def render("show.json", %{member: member}) do
    %{data: render_one(member, MemberView, "member.json")}
  end

  def render("member.json", %{member: member}) do
    %{id: member.id,
      first_name: member.first_name,
      last_name: member.last_name,
      email: member.email,
      encrypted_password: member.encrypted_password,
      last_sign_in: member.last_sign_in}
  end
end
