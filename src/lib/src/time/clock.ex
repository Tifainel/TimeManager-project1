defmodule Src.Time.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :status, :boolean, default: false
    field :time, :utc_datetime
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    # IO.inspect(attrs["clock"])

    # time = NaiveDateTime.from_iso8601!(attrs["time"])
    # IO.inspect(time)


    # clock
    # |> cast(%{"status" => "false", "time" => "2020-10-21T11:36:30", "user_id" => "1"}, [:time, :status, :user_id])
    # |> validate_required([:time, :status, :user_id])
    #data = %{"status"=>attrs}
    #ateTime.from_iso8601(
    clock
    |> cast(attrs["clock"], [:time, :status, :user_id])
    |> validate_required([:time, :status, :user_id])
    # #|> validate_required(:status)
  end
end
