 require 'mechanize'

 agent = Mechanize.new
  page = agent.get("https://gunosy.com/categories/1")
  elements = page.search(".list_title a")
  elements.each do |ele|
    puts ele.inner_text
  end