require 'mechanize'
require 'kconv'

# 北海道,関東,関西,九州,名古屋,仙台の6地域で管理されている
regions     = %w(hokkaido kanto kansai kyusyu nagoya sendai)
dormitories = []
agent       = Mechanize.new

regions.each do |region|
  @page = agent.get("http://www.dnet.gr.jp/menulist/search/#{region}.html")
  enum  = @page.body.lines.to_enum
  # htmlのすべての行を取得し正規表現で判定
  # サイトの構成的にdomでの判断が不可能
  loop do
    line = enum.next
    if line =~ /"ryou".+?="(.+?)"/
      pattern = $1
      # "ryou"があった次の行に寮の名前があるはず
      name    = enum.next.gsub(/<br\s?\/?>|<\/td>/, '').toutf8.strip
      dormitories << { name: name, pattern: pattern }
    end
  end
end

dormitories.uniq.each do |dormitory|
  Dormitory.seed_once(:name, :menu_type) do |s|
    s.name      = dormitory[:name]
    s.menu_type = dormitory[:pattern]
  end
end
