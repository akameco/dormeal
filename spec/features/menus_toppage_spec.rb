require 'rails_helper'

describe 'メニューの表示' do
  context 'ドーミー新松戸(a1)を寮に設定したとき' do
    before do
      login_dormitory_a1
    end
    it '今日のメニューと表示されていること' do
      expect(page).to have_content('今日のメニュー')
    end
    it '今日のメニューに今日の朝食(和)があること' do
      expect(page).to have_content('今日の朝食(和)')
    end
    it '今日のメニューに今日の朝食(洋)があること' do
      expect(page).to have_content('今日の朝食(洋)')
    end
    it '今日のメニューに今日の夕食があること' do
      expect(page).to have_content('今日の夕食')
    end

    it '明日のメニューと表示されていること' do
      expect(page).to have_content('明日のメニュー')
    end
    it '明日のメニューに明日の朝食(和)があること' do
      expect(page).to have_content('明日の朝食(和)')
    end
    it '明日のメニューに明日の朝食(洋)があること' do
      expect(page).to have_content('明日の朝食(洋)')
    end
    it '明日のメニューに明日の夕食があること' do
      expect(page).to have_content('明日の夕食')
    end
  end

  context 'フローラ(b2)を寮の設定したとき' do
    before do
      login_dormitory_b2
    end
    it '今日のメニューと表示されていること' do
      expect(page).to have_content('今日のメニュー')
    end

    it '明日のメニューと表示されていること' do
      expect(page).to have_content('明日のメニュー')
    end

    context 'メニューがnullのとき' do
      it '食堂はお休みですと表示されていること' do
        expect(page).to have_content('食堂はお休みです')
      end
    end
  end
end
