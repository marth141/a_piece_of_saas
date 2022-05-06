defmodule Db.UsersCompanies do
  alias Db.Accounts.User
  alias Db.Companies.Company
  alias Db.UsersCompanies.UserCompany

  def create_users_companies_association(%User{} = user, %Company{} = company) do
    changeset =
      UserCompany.changeset(%UserCompany{}, %{
        user_id: user.user_uuid,
        company_id: company.company_uuid
      })

    Db.Repo.insert(changeset)
  end
end
