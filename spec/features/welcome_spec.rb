require 'rails_helper'

describe 'トップページ' do
  context 'ルートに遷移したとき' do
    before { visit root_path }
    subject { page }

    it { is_expected.to have_title('ドーミール - 今日の献立') }
    it { is_expected.to have_content('ドーミールへようこそ') }

    context 'かつヘッター' do
      it { is_expected.to have_content('ドーミール') }
      it { is_expected.to have_link('Twitterを使ってログイン') }
    end

    context 'かつフッター' do
      it { is_expected.to have_content('© 2015 akameco') }
    end

    context 'かつログインユーザのとき' do
      before do
        visit root_path
        click_link 'ログイン'
      end
      it { is_expected.to have_link('寮の設定') }
    end

    context 'かつ非ログインユーザのとき' do
      it { is_expected.not_to have_link('設定') }
    end
  end
end
