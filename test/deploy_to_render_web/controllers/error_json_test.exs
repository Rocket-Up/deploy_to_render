defmodule DeployToRenderWeb.ErrorJSONTest do
  use DeployToRenderWeb.ConnCase, async: true

  test "renders 404" do
    assert DeployToRenderWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert DeployToRenderWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
