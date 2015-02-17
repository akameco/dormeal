require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:dormitory).class_name('Dormitory') }

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

    context '寮のidが追加されたとき' do
      it 'ユーザに設定したDormitoryが一致' do
        user           = User.find_or_create_from_auth_hash(auth_hash)
        dormitory      = Dormitory.find(1)
        user.dormitory = dormitory
        expect(user.dormitory).to eq dormitory
      end
    end
  end
end
