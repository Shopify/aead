require 'aead/cipher'
require 'aead/cipher/aes_hmac'

require 'securerandom'

#
# Encrypt plaintext using the CBC mode of AES and authenticate the
# result with HMAC-SHA-256.
#
class AEAD::Cipher::AES_256_CBC_HMAC_SHA_256 < AEAD::Cipher
  include AEAD::Cipher::AES_HMAC

  def self.key_len;   64; end
  def self.iv_len;    16; end
  def self.nonce_len; 16; end
  def self.tag_len;   32; end

  def self.encryption_key_len; 32; end
  def self.signing_key_len;    32; end

  def self.cipher_mode; 'aes-256-cbc'; end
  def self.digest_mode; 'SHA256'; end

  #
  # CBC requires a randomly-generated nonce.
  #
  def self.generate_nonce
    SecureRandom.random_bytes(self.nonce_len)
  end
end
