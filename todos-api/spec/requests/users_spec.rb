require 'rails_helper'

Rspec.describe 'Users Api', type: :request do

  let(:user) { build(:user) }

  let(:headers) { valid_headers.except('Authorization') }

  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end


  describe 'POST /signup' do

    context 'when valid request' do

      before {post 'signup', params: valid_attributes.to_json, headers: headers}

    end

    context 'when invalid request' do

    end

  end

end