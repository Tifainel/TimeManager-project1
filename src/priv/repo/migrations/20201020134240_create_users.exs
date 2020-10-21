defmodule Src.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :role, :integer, default: 0

      timestamps()
    end

  end
end
