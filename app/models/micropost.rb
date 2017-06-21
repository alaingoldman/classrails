class Micropost < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :message, presence: true

	def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	end
end
