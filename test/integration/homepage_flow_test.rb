require "test_helper"

class HomepageFlowTest < ActionDispatch::IntegrationTest

  def test_can_visit_the_homepage

    get root_path
    assert_response :success

    # should find .hero element
    assert_select ".hero"

  end

end
