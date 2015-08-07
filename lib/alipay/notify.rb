module Alipay
  module Notify
    def self.verify?(params, options = {})
      params.stringify_keys!
      pid = options[:pid] || Alipay.pid
      Sign.verify?(params) && verify_notify_id?(pid, params['notify_id'])
    end

    def self.verify_notify_id?(pid, notify_id)
      uri = URI(Alipay::Service::GATEWAY_URL)
      uri.query = URI.encode_www_form(
        'service'   => 'notify_verify',
        'partner'   => pid,
        'notify_id' => notify_id
      )
      Net::HTTP.get(uri) == 'true'
    end
  end
end
