defmodule Exgit.ClientTest do
  use ExUnit.Case

  import Tesla.Mock

  describe "get_repos_by_username/1" do
    test "When the user has repos, returns the repos." do
      username = "viniciuscrisol"
      response = [%{"id" => 1, "name" => "my_repo_1"}, %{"id" => 2, "name" => "my_repo_2"}]

      expected_response = {:ok, response}

      mock(fn %{method: :get, url: "https://api.github.com/users/viniciuscrisol/repos"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      assert Exgit.Client.get_repos_by_username(username) == expected_response
    end
  end
end
