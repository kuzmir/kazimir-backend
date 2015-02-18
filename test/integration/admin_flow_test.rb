require "test_helper"

class AdminFlowTest < ActionDispatch::IntegrationTest

  def test_admin_flow

    get admin_root_path
    assert_response 401

    # request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "admin")
    #
    # get admin_root_path
    # assert_response :success

  end

end
