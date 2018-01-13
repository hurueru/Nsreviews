class Scraping

def self.image_get
agent = Mechanize.new
page = agent.get("https://www.google.co.jp/search?q=/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png&tbm=isch&source=lnms&sa=X&ved=0ahUKEwi4tb7L1dTYAhUIwbwKHbYDBCkQ_AUICigB&biw=1366&bih=637&dpr=1")
elements = page.search('img')
elements.each do |ele|
  Image.create(image: ele.get_attribute('src'))
end
end
end