defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User
  alias Ecto.Changeset

  def create(conn, params) do
    params
    |> Rocketpay.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  # defp handle_response({:error, %Changeset{} = reason}, conn) do
  #   conn
  #   |> put_status(:bad_request)
  #   |> render("error.json", reason: reason)
  # end

  defp handle_response({:error, result}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
