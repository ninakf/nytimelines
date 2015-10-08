class Article < ActiveRecord::Base

	belongs_to :timeline

	def self.get_article (query)
		where("name LIKE ?", "%#{search}%") 
	end
end

