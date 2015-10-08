class Article < ActiveRecord::Base

	belongs_to :timeline

	def self.get_article (query)
		where("name LIKE ?", "%#{search}%") 
	end

	def self.search (query)
		url = URI.parse("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{query}&api-key=sample-key")
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
  			http.request(req)
		}
		parsed_body = JSON.parse(res.body)
		
		articles = []

		puts "Parsed Body"
		puts parsed_body 
		puts "Parsed Body Response"
		puts parsed_body["response"]
		puts "Parsed Body Docs"
		puts parsed_body["response"]["docs"]

		parsed_body["response"]["docs"].each do |doc|
			article = Article.create({:name => doc["headline"], :author => doc["byline"], :date => doc["pub_date"]})
			articles << article
		end

		return articles 
	end 
end

