require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_or_create_from_auth_hash' do
    let(:auth_hash) do
      {
        provider: 'twitter',
        uid:      'uid',
        info:     {
          nickname: 'akameco',
          image:    'http://example.com/akameco.png'
        }
      }
    end

    context '引数のproviderとuidに対応するUserが作成されていないとき' do
      it '引数で設定した属性のUserオブジェクトが返ること' do
        user = User.find_or_create_from_auth_hash(auth_hash)
        expect(user.provider).to eq 'twitter'
        expect(user.uid).to eq 'uid'
        expect(user.nickname).to eq 'akameco'
        expect(user.image_url).to eq 'http://example.com/akameco.png'
        expect(user).to be_persisted
      end
    end
  end
end
