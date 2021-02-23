defmodule RocketpayWeb.UsersView do
  alias Rocketpay.User
  #alias Ecto.Changeset

  def render("create.json", %{user: %User{id: id, name: name, nickname: nickname}}) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        nickname: nickname
      }
    }
  end

  # def render("error.json", %{reason: %Changeset{errors: errors}}) do
  #   %{
  #     message: "[ERROR] User create",
  #     details: %{
  #       errors: errors
  #     }
  #   }
  # end
end
