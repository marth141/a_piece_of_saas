defmodule Db do
  @moduledoc """
  Db keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def test() do
    {:ok, account} =
      Db.Accounts.register_user(%{email: "sulivan@king.com", password: "wubbalubbadubdub"})

    {:ok, company} = Db.Companies.create_company(%{company_name: "big pimpin inc"})

    {account, company}

    changeset =
      Db.UsersCompanies.changeset(%Db.UsersCompanies{}, %{
        user_id: account.user_uuid,
        company_id: company.company_uuid
      })

    Db.Repo.insert(changeset)
  end
end
