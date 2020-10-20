defmodule Timemanagerapi.Workingtimes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :utc_datetime
    field :start, :utc_datetime
    belongs_to :user, Timemanagerapi.Users

    timestamps()
  end

  @doc false
  def changeset(workingtimes, attrs) do
    workingtimes
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end])
  end
end
