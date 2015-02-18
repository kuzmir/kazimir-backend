require "test_helper"

class HomepageFlowTest < ActionDispatch::IntegrationTest

  def test_can_visit_the_homepage

    get root_path
    assert_response :success

    # should find .hero element with H1 element
    assert_select ".hero" do
      assert_select "h1"
    end

  end

end
