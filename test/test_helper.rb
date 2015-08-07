$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'alipay'

require 'minitest/autorun'

Alipay.pid = '1000000000000000'
Alipay.key = '10000000000000000000000000000000'
