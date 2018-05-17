require 'capybara/rspec'
require 'rails_helper'

# RSpec.describe "urls/index.html.erb", type: :view do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


  describe "index page" do
    before(:each) do
    	Url.create(long_url: "https://google.com")
    	Url.create(long_url: "https://facebook.com")
    	Url.create(long_url: "https://twitter.com")
      visit urls_path
    end

    it "should list all long urls" do
    	Url.all.each do |url|
    		page.should have_content(url.long_url)
      	end
    end

    it "should list all short urls" do
      Url.all.each do |url|
    	page.should have_content(url.short_url)
      end
    end

    it "should see the link for getting short url" do
		click_link 'Shorten Url!'
			visit new_url_path
		end
	end
