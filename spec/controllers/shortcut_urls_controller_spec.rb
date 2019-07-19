# frozen_string_literals: true

require 'rails_helper'

RSpec.describe ShortcutUrlsController do
  describe 'GET #new' do
    subject { get(:new) }

    it { is_expected.to render_template(:new) }
  end

  describe 'POST #create' do
    subject do
      post(:create, params: { shortcut_url: { redirect_to: original_url } })
    end

    let(:original_url) { Faker::Internet.url }

    it { is_expected.to render_template(:create) }

    context 'when shortcut_url[redirect_to] param is blank' do
      let(:original_url) { '' }

      it { is_expected.to render_template(:new) }
    end
  end

  describe 'GET #show' do
    context 'when token exists' do
      subject { get(:show, params: { token: token }) }

      let(:shortcut_url) { create(:shortcut_url) }
      let(:token) { shortcut_url.token }

      it { is_expected.to redirect_to(shortcut_url.redirect_to) }
    end

    context 'when token is not exists' do
      let(:token) { 'invalid_token' }

      it 'raises NotFound error' do
        expect { get(:show, params: { token: token }) }
          .to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
