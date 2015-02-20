require "test_helper"

class PagesControllerTest < ActionController::TestCase

  def test_should_get_index
    get :index
    assert_response :success
    assert_select '.navbar-brand'
  end

  def test_should_render_404_when_static_page_missing
    get :static, page: 'foo'
    assert_response 404
  end

  def test_should_render_static_page
    get :static, page: 'about'
    assert_response :success
  end

end
