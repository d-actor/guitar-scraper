namespace :scrape do
  desc 'Scrape all guitars from the first page of results from musiciansfriend.com'
  task guitars: :environment do
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    page = agent.get('https://www.musiciansfriend.com')
    search_form = page.forms.first
    search_form['field-keywords'] = 'Guitar'
    page = search_form.submit
    guitars = page.search('li.product-container')
    guitar_count = 0
    guitars.each do |guitar|
      image_url = guitar.at_css('.lazy').attributes["data-original"].value
      name = guitar.search('a').text
      stars = guitar.search('span.stars').text
      price = guitar.search('span.productPrice').text.strip
      Guitar.create(name: name, image_url: image_url, price: price, stars: stars)
      guitar_count += 1
      puts "Guitar scraped"
    end
    puts "#{guitar_count} guitars scraped from Musicians Friend!"
  end
end

