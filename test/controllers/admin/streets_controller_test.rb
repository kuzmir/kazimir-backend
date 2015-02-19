require "test_helper"

class Admin::StreetsControllerTest < ActionController::TestCase

  def test_should_get_list_of_streets

    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "admin")

    get :index
    assert_response :success
    assert_not_nil assigns(:streets)
  end
end
