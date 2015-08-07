module Alipay
  module Sign
    def self.generate(params, options = {})
      key = options[:key] || Alipay.key
      RSA.sign(key, to_query(params))
    end

    def self.verify?(params)
      params.delete('sign_type')
      sign = params.delete('sign')
      RSA.verify?(to_query(params), sign)
    end

    def self.to_query(params)
      params.stringify_keys.sort.map { |e| e.join('=') }.join('&')
    end
  end
end
