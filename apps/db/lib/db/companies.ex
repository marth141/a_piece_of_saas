defmodule Db.Companies do
  alias Db.{Repo, Companies.Company}

  def create_company(attrs) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  def get_company(id) do
    Repo.get(Company, id)
  end
end
