require "test_helper"

class PagesControllerTest < ActionController::TestCase

  def test_should_get_index
    get :index
    assert_response :success
  end

end
