# frozen_string_literal: true

class VisitShortcutUrlService
  pattr_initialize :token

  def self.perform(token)
    new(token).perform
  end

  def perform
    shortcut_url = ShortcutUrl.find_by!(token: token)
    shortcut_url.touch(:last_visited_at)
    shortcut_url.redirect_to
  end
end
