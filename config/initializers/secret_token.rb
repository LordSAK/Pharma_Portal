# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.


require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

PharmaPortal::Application.config.secret_key_base = secure_token



#PharmaPortal::Application.config.secret_key_base = 'e94e4415ba45831e1eec4fdec98af7c2cf4b538b0c409dae6fce2f0bd68a48187e87b3ed021bc896f4fcbe0521393bb5d5321f56405aa7ce8e48b171e8f89224'
