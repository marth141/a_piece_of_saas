defmodule Db.UsersCompaniesTest do
  use Db.DataCase

  describe "create_users_companies_association/2" do
    test "inserts a user and company association" do
      {:ok, account} =
        Db.Accounts.register_user(%{email: "sullivan@king.com", password: "wubbalubbadubdub"})

      {:ok, company} = Db.Companies.create_company(%{company_name: "big pimpin inc"})

      assert {:ok, %Db.UsersCompanies.UserCompany{}} =
               Db.UsersCompanies.create_users_companies_association(account, company)

      assert %Db.Accounts.User{companies: [%Db.Companies.Company{} | _companies_tail]} =
               Db.Repo.get(Db.Accounts.User, account.user_uuid)
               |> Db.Repo.preload(:companies)

      assert %Db.Companies.Company{users: [%Db.Accounts.User{} | _users_tail]} =
               Db.Repo.get(Db.Companies.Company, company.company_uuid)
               |> Db.Repo.preload(:users)
    end
  end
end
