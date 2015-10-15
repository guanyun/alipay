module Alipay
  module Sign
    class RSA
      APP_PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\n" \
            "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRA\n" \
            "FljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQE\n" \
            "B/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5Ksi\n" \
            "NG9zpgmLCUYuLkxpLQIDAQAB\n" \
            '-----END PUBLIC KEY-----'

      def self.sign(key, string)
        rsa = OpenSSL::PKey::RSA.new(key)
        digest = OpenSSL::Digest::SHA1.new
        Base64.encode64(rsa.sign(digest, string))
      end

      def self.verify?(string, sign)
        rsa = OpenSSL::PKey::RSA.new(APP_PUBLIC_KEY)
        digest = OpenSSL::Digest::SHA1.new
        match = rsa.verify(digest, Base64.decode64(sign), string)
        OpenSSL.errors.clear
        match
      end
    end
  end
end
