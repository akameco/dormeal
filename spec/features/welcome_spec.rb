require 'rails_helper'

describe 'トップページ' do
  context 'ルートに遷移したとき' do
    before do
      visit root_path
    end
    it '寮飯にようこそと表示されること' do
      expect(page).to have_content('寮飯にようこそ')
    end
  end
end
