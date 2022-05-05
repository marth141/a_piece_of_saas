defmodule Db.UsersCompaniesTest do
  use Db.DataCase

  describe "create_users_companies_association/2" do
    test "inserts a user and company association" do
      {:ok, account} =
        Db.Accounts.register_user(%{email: "sullivan@king.com", password: "wubbalubbadubdub"})

      {:ok, company} = Db.Companies.create_company(%{company_name: "big pimpin inc"})

      changeset =
        Db.UsersCompanies.UserCompany.changeset(%Db.UsersCompanies.UserCompany{}, %{
          user_id: account.user_uuid,
          company_id: company.company_uuid
        })

      assert {:ok, %Db.UsersCompanies.UserCompany{}} = Db.Repo.insert(changeset)
    end
  end
end
