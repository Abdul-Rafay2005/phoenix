defmodule HelloworldWeb.TaskController do
  use HelloworldWeb, :controller

  alias Helloworld.Tasks
  alias Helloworld.Tasks.Task

  def create(conn, %{"task" => task_params}) do
    user = conn.assigns.current_user
    task_params = Map.put(task_params, "user_id", user.id)

    case Tasks.create_task(task_params) do
      {:ok, _task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: ~p"/")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Could not create task.")
        |> render(:new, changeset: changeset)
    end
  end
end