defmodule Src.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    field :role, :integer, default: 0

    timestamps()
  end

  # Role de l'utilisateur, utiliser Enum.at(role, **index**)
  role = ["user","manager", "general mananger"]

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :role])
    |> validate_required([:username, :email, :role])
    |> unique_constraint([:username, :email])
    |> validate_inclusion(:role, 0..2)
  end
end
