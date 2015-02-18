namespace :menus do
  desc '来月の寮の献立を取得してデータベースを更新'
  task :add_menus => :environment do
    menus = Scraping::generate_menus(month: 'next_month')
    menus.each do |menu|
      Menu.create(menu[:breakfast_j])
    end
  end
end
