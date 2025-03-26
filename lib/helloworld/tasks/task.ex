defmodule Helloworld.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :priority, :integer
    field :description, :string
    field :title, :string
    field :completed, :boolean, default: false
    field :due_date, :date
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :due_date, :priority, :user_id, :completed])
    |> validate_required([:title, :description, :due_date, :priority, :user_id])
  end
end