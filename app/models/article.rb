class Article < ActiveRecord::Base

	belongs_to :timeline

	def self.get_article (query)
		where("name LIKE ?", "%#{search}%") 
	end

	def self.search (query, timeline)
		url = URI.parse("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=" + query + "&api-key=sample-key")
		puts url
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
  			http.request(req)
		}
		parsed_body = JSON.parse(res.body)
		
		articles = []

		parsed_body["response"]["docs"].each do |doc|
			article = Article.create({:name => doc["headline"], :author => doc["byline"], :date => doc["pub_date"], :timeline_id => timeline.id})
			articles << article
		end

		return articles 
	end 
end

