module Alipay
  module Service
    GATEWAY_URL = 'https://mapi.alipay.com/gateway.do'

    %w(app wap).each do |name|
      define_singleton_method "#{name}_pay_url" do |params, options = {}|
        params = {
          'service'        => services[name],
          '_input_charset' => 'utf-8',
          'partner'        => options[:pid] || Alipay.pid,
          'seller_id'      => options[:pid] || Alipay.pid,
          'payment_type'   => '1'
        }.merge(params.stringify_keys)

        request_uri(params, options).to_s
      end
    end

    def self.request_uri(params, options = {})
      uri = URI(GATEWAY_URL)
      uri.query = URI.encode_www_form(sign_params(params, options))
      uri
    end

    def self.sign_params(params, options = {})
      params.merge(
        'sign_type' => Alipay.sign_type,
        'sign'      => Alipay::Sign.generate(params, options)
      )
    end

    def self.services
      {
        'app' => 'create_direct_pay_by_user',
        'wap' => 'alipay.wap.create.direct.pay.by.user'
      }
    end
  end
end
