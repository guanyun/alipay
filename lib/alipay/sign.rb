module Alipay
  module Sign
    def self.generate(params, options = {})
      key = options[:key] || Alipay.key
      RSA.sign(key, to_query(params))
    end

    def self.verify?(params)
      params.delete('sign_type')
      sign = params.delete('sign')
      RSA.verify?(to_query(params), sign, :app)
    end

    def self.to_query(params)
      Hash[params.stringify_keys.sort].to_query
    end
  end
end
