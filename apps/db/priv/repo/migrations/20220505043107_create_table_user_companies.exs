defmodule Db.Repo.Migrations.CreateTableUsersCompanies do
  use Ecto.Migration

  def up do
    create table(:users_companies, primary_key: false) do
      add :user_id, references(:users, column: :user_uuid, type: :uuid)
      add :company_id, references(:companies, column: :company_uuid, type: :uuid)
      timestamps()
    end
  end

  def down do
    drop table(:user_companies)
  end
end
