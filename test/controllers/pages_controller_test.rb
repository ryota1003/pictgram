require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get custom.scss" do
    get pages_custom.scss_url
    assert_response :success
  end

end
