require 'test_helper'

class AlipayTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Alipay::VERSION
  end

  def test_sign_type_default
    assert_equal 'RSA', Alipay.sign_type
  end
end
