defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Thales Menezes",
        age: 22,
        email: "contato@thlmenezes.com.br",
        nickname: "thlmenezes",
        password: "12345678"
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Thales Menezes", age: 22, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Thales Menezes",
        age: 15,
        email: "contato@thlmenezes.com.br",
        nickname: "thlmenezes"
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
