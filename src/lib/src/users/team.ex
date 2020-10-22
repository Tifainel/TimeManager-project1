defmodule Src.Users.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :members, {:array, :integer}
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:members])
    |> validate_required([:members])
  end
end
