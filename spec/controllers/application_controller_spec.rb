require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :authenticate, only: :require_login

    def require_login
      render text: 'hello!'
    end
  end

  context '#authenticate が before_action として設定されているアクションを実行したとき' do
    before do
      routes.draw { get 'require_login' => 'anonymous#require_login' }
    end
    context 'かつログイン中なとき' do
      before { session[:user_id] = 1 }
      it 'ステータスコードとして200が返ること' do
        get :require_login
        expect(response.status).to eq 200
      end
    end
    context 'かつ未ログイン中なとき' do
      it 'トップページにリダイレクトすること' do
        get :require_login
        expect(response).to redirect_to root_path
      end
    end
  end
end