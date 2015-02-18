def sign_in
  user = User.find_or_create_from_auth_hash(
    {
      provider: 'twitter',
      uid:      'uid',
      info:     {
        nickname: 'akameco',
        image:    'http://example.com/akameco.png'
      }

    })
  visit root_path
  click_link 'ログイン'
end

def login_dormitory_a1
  sign_in
  click_link 'ドーミー新松戸'
  click_link 'この寮に設定する'
end

def login_dormitory_b2
  sign_in
  click_link 'Flora（フローラ）'
  click_link 'この寮に設定する'
end
