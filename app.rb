require 'nokogiri'
require 'open-uri'
require 'haml'
require 'yaml'
require 'digest/md5'

helpers do

  def rewrite_image(url, src)
    doc = Nokogiri::HTML(open(url))
    doc.css(src).each do |link|
      img = link.attributes['src'].value
      return img.match(/^http.+/) ? img : "#{url}#{img}" 
    end
  end

end

config = YAML.load_file("#{Dir.pwd}/config/rss.yml")

not_found do
  haml :'404'
end

get '/news/:url' do
	cache_control :public, :must_revalidate, :max_age => 600
	content_type 'application/rss+xml'
	@url = config['news'][params[:url]]
	haml(:rss_news)
end

get '/comics/:url' do
	cache_control :public, :must_revalidate, :max_age => 600
	content_type 'application/rss+xml'
	@url = config['comics'][params[:url]]
	haml(:rss_comics)
end

get '/test/:type/:url' do
	#cache_control :public, :must_revalidate, :max_age => 60
	content_type 'application/rss+xml'
	@url = config[params[:type]][params[:url]]
	haml(:test)
end

get '/all' do
  @url = config
  haml(:all)
end


