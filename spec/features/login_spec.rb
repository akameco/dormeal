require 'rails_helper'

describe 'ユーザーがログインをする' do

  shared_examples 'クリックしたとき' do
    context 'かつtwitterでのログインが成功したとき' do
      before do
        visit root_path
        click_link twitter_link
      end

      it '寮の設定画面に遷移していること' do
        expect(page.current_path).to eq dormitory_index_path
      end
    end

    context 'かつTwitterでのログインに失敗したとき' do
      around do |example|
        original_mock_auth                  = OmniAuth.config.mock_auth[:twitter]
        OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
        visit root_path
        click_link 'ログイン'
        example.run
        OmniAuth.config.mock_auth[:twitter] = original_mock_auth
      end

      it 'トップページに遷移していること' do
        expect(page.current_path).to eq root_path
      end

      it '"ログインに失敗しました"と表示されること' do
        expect(page).to have_content 'ログインに失敗しました'
      end
    end

  end

  context 'トップページに遷移しヘッダーの"ログイン"' do
    let(:twitter_link) { 'ログイン' }
    it_behaves_like 'クリックしたとき'
  end

  context 'トップページに遷移しbodyの"Twitterでログイン"' do
    let(:twitter_link) { 'Twitterを使ってログイン' }
    it_behaves_like 'クリックしたとき'
  end
end
