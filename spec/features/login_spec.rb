require 'rails_helper'

describe 'ユーザーがログインをする' do
  context 'トップページに遷移し"twitterでログイン"をクリックした時' do
    context 'かつtwitterでのログインが成功した時' do
      before do
        visit root_path
        click_link 'Twitterでログイン'
      end

      it 'トップページ遷移していること' do
        expect(page.current_path).to eq root_path
      end

      it 'ログインが成功しましたと表示されること' do
        expect(page).to have_content('ログインに成功しました')
      end
    end

    context 'かつTwitterでのログインに失敗したとき' do
      around do |example|
        original_mock_auth                  = OmniAuth.config.mock_auth[:twitter]
        OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
        visit root_path
        click_link 'Twitterでログイン'
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
end
