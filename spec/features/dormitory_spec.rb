require 'rails_helper'

describe 'ユーザが寮を選択する' do
  let!(:dormitory_1) { Dormitory.find(1) }
  let!(:dormitory_2) { Dormitory.find(2) }
  let!(:dormitory_3) { Dormitory.find(3) }

  context 'ログインユーザがアクセスしたとき' do
    let!(:user) { OmniAuth.config.mock_auth[:twitter] }
    before do
      visit root_path
      click_link 'ログイン'
    end

    it '寮を設定と表示されていること' do
      expect(page).to have_content('寮を設定')
    end

    it '寮の一覧が表示されていること' do
      expect(page).to have_content(dormitory_1.name)
      expect(page).to have_content(dormitory_2.name)
      expect(page).to have_content(dormitory_3.name)
    end


    context 'ドーミー新松戸をクリックしたとき' do
      before do
        click_link 'ドーミー新松戸'
      end
      it 'ドーミー新松戸と表示されていること' do
        expect(page).to have_content('ドーミー新松戸')
      end

      it 'この寮に設定リンクが表示されていること' do
        expect(page).to have_link('この寮に設定する')
      end

      it '選択に戻るボタンがあること' do
        expect(page).to have_link('選択へ戻る')
      end

      context 'かつこの寮に設定をクリックしたとき' do
        before do
          click_link 'この寮に設定する'
        end

        it 'ヘッダーにドーミー新松戸の名前があること' do
          expect(page).to have_content 'ドーミー新松戸'
        end
      end

      context 'かつ選択へ戻るをクリックしたとき' do
        before { click_link '選択へ戻る' }
        it '寮の設定ページであること' do
          expect(page).to have_content '寮を設定'
        end
      end
    end

    context 'かつフォームで検索したとき' do
      before do
        fill_in '寮の名前', with: '新松戸'
        click_button '検索'
      end

      it '条件に合う寮名のみ表示されていること' do
        expect(page).to have_content '新松戸'
        expect(page).not_to have_content 'ミネルヴァ'
      end
    end
  end
end
