require 'test_helper'

class CompaniesDashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companies_dashboards_index_url
    assert_response :success
  end

end
