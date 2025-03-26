defmodule Helloworld.Repo.Migrations.AddCompletedToTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :completed, :boolean, default: false, null: false
    end
  end
end