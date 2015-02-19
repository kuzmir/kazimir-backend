require "test_helper"

class StreetsControllerTest < ActionController::TestCase

  def test_list_the_streets

    get :index
    assert_response :success
    assert_not_nil assigns(:streets)

  end

end
