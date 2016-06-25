module UsersHelper

	def self.search_user(search)
    	where("LOWER(username) LIKE LOWER(?)", "%#{search}%")
	end
end
