class Scraping

def self.image_get
links = []
agent = Mechanize.new
next_url = ""

while true
  page = agent.get("https://www.google.co.jp/search?q=/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png&tbm=isch&source=lnms&sa=X&ved=0ahUKEwi4tb7L1dTYAhUIwbwKHbYDBCkQ_AUICigB&biw=1366&bih=637&dpr=1")
  elements = page.search('img')
  elements.each do |ele|
    links << ele.get_attribute('href')
    Image.create(image: ele.get_attribute('src'))
  end

  next_link = current_page.at('pagination .next a')
  break unless next_link
  next_url = next_link.get_attribute('href')
  end
links.each do |link|
  get_product('https://gunosy.com/categories/1' +link)
  end
end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.entry-title').inner_text if page.at('.entry-title')
    image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img')
    product = Product.where(title: title, image_url: image_url).first_or_initialize
    product.save
  end
end
end