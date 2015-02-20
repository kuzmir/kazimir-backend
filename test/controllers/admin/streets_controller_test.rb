require "test_helper"

class Admin::StreetsControllerTest < ActionController::TestCase

  def test_should_get_list_of_streets

    authenticate

    get :index
    assert_response :success
    assert_not_nil assigns(:streets)
  end


  def test_should_get_new_street_action

    authenticate

    get :new
    assert_response :success
    assert_not_nil assigns(:street)

  end


  private

    def authenticate
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "admin")
    end


end
