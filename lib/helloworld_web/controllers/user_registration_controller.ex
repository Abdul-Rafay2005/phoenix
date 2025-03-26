defmodule HelloworldWeb.UserRegistrationController do
  use HelloworldWeb, :controller

  alias Helloworld.Accounts
  alias Helloworld.Accounts.User
  alias HelloworldWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            fn token ->
              "https://phoenix-production-4fd5.up.railway.app/users/confirm/#{token}"
            end
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end