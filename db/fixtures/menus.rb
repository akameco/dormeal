ScrapingMenus.generate_menus.each do |menu|
  Menu.seed_once(:menu_type, :open_day) do |s|
    s.menu_type   = menu[:menu_type]
    s.breakfast_j = menu[:breakfast_j]
    s.breakfast_w = menu[:breakfast_w]
    s.dinner      = menu[:dinner]
    s.open_day    = menu[:date]
  end
end

