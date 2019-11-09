class Scraping 
  def self.get_name
    names = []
    agent = Mechanize.new 
    page = agent.get("file:///Users/matsunamiyutaro/Desktop/カリキュラム用/category-copy.html")
    elements = page.search('a')
    elements.each do |ele|
    names << ele.inner_text
  end
    names.each do |name|
      category = Category.new(name: name)
      category.save
    end
  end
end



