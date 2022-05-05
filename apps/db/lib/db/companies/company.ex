defmodule Db.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:company_uuid, :binary_id, autogenerate: true}

  schema "companies" do
    field :company_name, :string

    many_to_many :users, Db.Accounts.User,
      join_through: "users_companies",
      join_keys: [company_id: :company_uuid, user_id: :user_uuid]

    timestamps()
  end

  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:company_name])
    |> validate_required([:company_name])
  end
end
