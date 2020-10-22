defmodule Src.Users.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :members, {:array, :integer}
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:members, :name, :user_id])
    |> validate_required([:user_id, :name])
  end
end
