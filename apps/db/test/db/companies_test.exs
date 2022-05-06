defmodule Db.CompaniesTest do
  use Db.DataCase
  alias Db.{Companies.Company}

  describe "create_company/1" do
    test "inserts a company into the database" do
      attrs = %{
        company_name: "big penny music enterprises"
      }

      assert {:ok, %Company{}} = Db.Companies.create_company(attrs)
    end
  end

  describe "get_company/1" do
    test "read a company from the database" do
      attrs = %{
        "company_name" => "big penny music enterprises"
      }

      {:ok, %Company{company_uuid: company_uuid}} = Db.Companies.create_company(attrs)

      assert %Company{} = Db.Companies.get_company(company_uuid)
    end
  end
end
