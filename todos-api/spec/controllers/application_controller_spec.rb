require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  #create test user

  let(:user) { create(:user) }

  #set headers

  let(:headers) { { 'Authorization' => token_generator(user.id) } }
  let(:invalid_headers) { { 'Authotization' => nil } }

  describe 'authorize request' do

    context 'when auth token is present' do

      before { allow(request).to receive(:headers).and_return(headers)}

      it 'sets the current user' do
        expect(subject.instance_eval { authorize_request } ).to eq(user)
      end

    end

    context  'when auth token is missing' do

      before { allow(respect).to receive(:headers).and_return(invalid_headers) }

      it 'raises missing token error' do
        expect { subject.instance_eval { authorize_request }  }
          .to raise_error(ExceptionHandler::MissingToken, /Missing token/)
      end

    end

  end

end