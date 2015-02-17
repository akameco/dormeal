require 'rails_helper'

describe 'トップページ' do
  context 'ルートに遷移したとき' do
    before { visit root_path }
    subject { page }

    it { is_expected.to have_title('ドーミール - 今日の献立') }
    it { is_expected.to have_content('ドーミールへようこそ') }

    context 'ヘッター' do
      it { is_expected.to have_content('ドーミール') }
      it { is_expected.to have_link('Twitterでログイン') }
    end

    context 'フッター' do
      it { is_expected.to have_content('2014 © akameco') }
    end

    context 'ログインユーザのとき' do
      before do
        visit root_path
        click_link 'ログイン'
      end
      it { is_expected.to have_link('設定') }
    end

    context '非ログインユーザのとき' do
      it { is_expected.not_to have_link('設定') }
    end
  end
end
