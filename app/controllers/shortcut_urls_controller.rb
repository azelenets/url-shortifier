# frozen_string_literal: true

# Controller to handle requests to create short URL
class ShortcutUrlsController < ApplicationController
  def new
    @shortcut_url ||= ShortcutUrl.new
  end

  def create
    @shortcut_url = CreateShortcutUrlService.perform(*new_shortcut_url_params)

    if @shortcut_url.persisted?
      render :create
    else
      render :new
    end
  end

  def show
    redirect_to(root_url) unless params[:token]

    @shortcut_url = ShortcutUrl.find_by!(token: params[:token])
    redirect_to(@shortcut_url.redirect_to)
  end

  private

  def new_shortcut_url_params
    params.require(:shortcut_url).permit(:redirect_to)
  end
end
