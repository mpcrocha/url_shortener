require 'rails_helper'

RSpec.describe UrlShortenerController, type: :controller do

  let(:original_url) {'https://www.google.com'}
  let(:params) { { original_url: original_url } }

  subject do
    post :create, params: params
    response
  end

  describe '#create' do
    context 'when original url is correct' do

      it { is_expected.to have_http_status(:created) }
    end

    context 'when original url is blank' do
      let(:params) { { original_url: '' } }
      it{ is_expected.to have_http_status :bad_request }
    end

    context 'when original url is wrong' do
      let(:params) { { original_url: 'www.google.com' } }
      it{ is_expected.to have_http_status :bad_request }
    end
  end
end