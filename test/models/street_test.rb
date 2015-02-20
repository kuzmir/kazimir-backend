require "test_helper"

class StreetTest < ActiveSupport::TestCase

  def test_should_not_save_invalid_street
    street = Street.new
    assert_not street.valid?
  end

end
