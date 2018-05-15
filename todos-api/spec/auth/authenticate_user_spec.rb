require 'rails_helper'

RSpec.describe AuthenticateUser do

  # create test user
  let(:user) { create(:user) }

  # valid request subject
  let(:valid_auth_obj) { described_class.new(user.email, user.password) }

  # invalid request subject
  let(:invalid_auth_obj) { described_class.new('Foo', 'Bar') }

  # Test suite for AuthenticateUser#call
  describe  '#call' do


    context 'when valid credentials' do

      it 'returns valid token object' do
        token = valid_auth_obj.call
        expect(token).not_to be_nil
      end

    end

    context 'when invalid credentials' do

      it 'raises an authentication error ' do
        expect { invalid_auth_obj.call }
            .to raise_error(
            ExceptionHandler::AuthenticationError,
            /Invalid credentials/
          )
      end

    end

  end

end