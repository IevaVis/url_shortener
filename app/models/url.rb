class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :short_url, presence: true
	validates :long_url, :format => URI::regexp(%w(http https))

	def self.retrieve_short_url(long_url)
		@url = Url.find_by(long_url: long_url)
		if @url
			return @url.short_url 
		end
		
	end

end