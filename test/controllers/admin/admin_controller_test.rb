require "test_helper"

class Admin::AdminControllerTest < ActionController::TestCase

  def test_should_not_get_index_when_unauthorized
    get :index

    assert_response 401
  end

  def test_should_get_index_with_admin_credentials

    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "admin")

    get :index
    assert_response :success

  end

end
