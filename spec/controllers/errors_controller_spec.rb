# frozen_string_literals: true

require 'rails_helper'

RSpec.describe ErrorsController do
  describe 'GET #not_found' do
    subject { get(:not_found) }

    it { is_expected.to render_template(:not_found) }
  end
end
