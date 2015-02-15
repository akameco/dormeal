require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #create' do
    context 'User.find_or_create_from_auth_hashがid: 1のオブジェクトを返すとき' do
      before do
        allow(User).to receive(:find_or_create_from_auth_hash) { double('user', id: 1) }
        get :create, provider: 'twitter'
      end

      it 'session[:user_id]に1が格納されること' do
        expect(session[:user_id]).to eq 1
      end

      it 'トップページにリダイレクトすること' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
