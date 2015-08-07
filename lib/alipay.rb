require 'alipay/version'
require 'alipay/sign'
require 'alipay/sign/rsa'
require 'alipay/service'
require 'alipay/notify'

module Alipay
  @sign_type = 'RSA'

  class << self
    attr_accessor :pid, :key, :sign_type
  end
end
