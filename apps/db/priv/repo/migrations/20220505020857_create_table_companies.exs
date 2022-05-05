defmodule Db.Repo.Migrations.CreateTableCompanies do
  use Ecto.Migration

  def up() do
    create table(:companies, primary_key: false) do
      add :company_uuid, :uuid, primary_key: true
      add :company_name, :string
      timestamps()
    end
  end

  def down() do
    drop table(:companies)
  end
end
