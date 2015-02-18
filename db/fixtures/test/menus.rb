# coding: utf-8

Menu.seed_once(:menu_type, :open_day) do |s|
  s.menu_type   = 'a1'
  s.breakfast_j = '今日の朝食(和)'
  s.breakfast_w = '今日の朝食(洋)'
  s.dinner      = '今日の夕食'
  s.open_day    = Date.today
end

Menu.seed_once(:menu_type, :open_day) do |s|
  s.menu_type   = 'a1'
  s.breakfast_j = '明日の朝食(和)'
  s.breakfast_w = '明日の朝食(洋)'
  s.dinner      = '明日の夕食'
  s.open_day    = Date.tomorrow
end

Menu.seed_once(:menu_type, :open_day) do |s|
  s.menu_type   = 'b2'
  s.breakfast_j = nil
  s.breakfast_w = nil
  s.dinner      = nil
  s.open_day    = Date.today
end

Menu.seed_once(:menu_type, :open_day) do |s|
  s.menu_type   = 'b2'
  s.breakfast_j = nil
  s.breakfast_w = nil
  s.dinner      = nil
  s.open_day    = Date.tomorrow
end
