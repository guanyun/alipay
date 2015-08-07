require 'test_helper'

module Alipay
  class ServiceTest < Minitest::Test
    def test_services_should_return_its_name
      assert_equal Alipay::Service.services[:app], 'create_direct_pay_by_user'
      assert_equal Alipay::Service.services[:wap], 'alipay.wap.create.direct.pay.by.user'
    end
  end
end
