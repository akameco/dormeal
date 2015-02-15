require 'rails_helper'

describe 'ユーザーがログアウトする' do
  context 'ログインユーザがトップページに遷移したとき' do
    before do
      visit root_path
      click_link 'ログイン'
    end

    it 'ログアウトリンクが表示されていること' do
      expect(page).to have_link 'ログアウト'
    end

    context 'かつログアウトリンクをクリックしたとき' do
      before do
        click_link 'ログアウト'
      end

      it 'ログアウトしましたと表示されること' do
        expect(page).to have_content('ログアウトしました')
      end

      it 'ログアウトリンクが表示されていないこと' do
        expect(page).not_to have_link('ログアウト')
      end
    end
  end
end
