# frozen_string_literal: true

require 'rails_helper'

describe ShortcutUrl do
  subject { create(:shortcut_url) }

  describe 'ActiveModel Validations' do
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_uniqueness_of(:token) }
    it { is_expected.to validate_presence_of(:redirect_to) }
  end
end
