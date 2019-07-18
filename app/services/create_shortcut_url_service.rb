# frozen_string_literal: true

class CreateShortcutUrlService
  TOKEN_ALPHABET = Array('A'..'Z') + Array('a'..'z') + Array(0..9) + %w[_ , -]

  pattr_initialize %i[redirect_to]

  def self.perform(attrs)
    new(attrs.to_h.symbolize_keys).perform
  end

  def perform
    ShortcutUrl.create(redirect_to: redirect_to, token: generate_uniq_token)
  end

  private

  def generate_uniq_token(length = 6)
    loop do
      token = Array.new(length) do
        TOKEN_ALPHABET.sample(random: SecureRandom)
      end.join
      break token unless ShortcutUrl.exists?(token: token)
    end
  end
end
