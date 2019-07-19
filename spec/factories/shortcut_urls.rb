# frozen_string_literal: true

FactoryBot.define do
  factory :shortcut_url, class: ShortcutUrl do
    token { CreateShortcutUrlService.new.send(:generate_uniq_token) }
    redirect_to { Faker::Internet.url }
  end
end
