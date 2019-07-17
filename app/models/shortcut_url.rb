# frozen_string_literal: true

# Model to represent Shortcut URL
class ShortcutUrl < ApplicationRecord
  has_secure_token :token

  validates :redirect_to, presence: true
  validates :token, presence: true
end
