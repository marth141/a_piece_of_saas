defmodule Db.UsersCompanies do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "users_companies" do
    belongs_to :user, Db.Accounts.User, references: :user_uuid, type: :binary_id
    belongs_to :company, Db.Companies.Company, references: :company_uuid, type: :binary_id
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :company_id])
    |> validate_required([:user_id, :company_id])
  end
end
