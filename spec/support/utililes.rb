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

