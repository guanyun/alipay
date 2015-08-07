module Alipay
  module Sign
    class RSA
      APP_PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\n" \
            "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRA\n" \
            "FljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQE\n" \
            "B/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5Ksi\n" \
            "NG9zpgmLCUYuLkxpLQIDAQAB\n" \
            '-----END PUBLIC KEY-----'

      WAP_PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\n" \
            "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCu1vPyDHqLlIOSTMc84Gu8r19iv3zBcHVfklCn\n" \
            "3TdrHelf+i++jnDCE7vz3wxrcRDnrrP5fNZymfvAqHk5sTvcz47ngPs7kKq3LEQgNGk7fuwrFfWT\n" \
            "e4p824DEdcgPzCVTQTCdS1HD82wVT9aOvKLXeEN7XMQLYSt2lHxGIbbGSwIDAQAB\n" \
            '-----END PUBLIC KEY-----'

      def self.sign(key, string)
        rsa = OpenSSL::PKey::RSA.new(key)
        digest = OpenSSL::Digest::SHA1.new
        Base64.encode64(rsa.sign(digest, string))
      end

      def self.verify?(string, sign, key_type)
        rsa = OpenSSL::PKey::RSA.new(key_type == :app ? APP_PUBLIC_KEY : WAP_PUBLIC_KEY)
        digest = OpenSSL::Digest::SHA1.new
        rsa.verify(digest, Base64.decode64(sign), string)
      end
    end
  end
end
