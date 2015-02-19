require "test_helper"

class StreetTest < ActiveSupport::TestCase

  def street
    @street ||= Street.new
  end

  def test_valid
    assert street.valid?
  end

end
