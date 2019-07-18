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
    redirect_to(VisitShortcutUrlService.perform(params[:token]))
  end

  private

  def new_shortcut_url_params
    params.require(:shortcut_url).permit(:redirect_to)
  end
end
