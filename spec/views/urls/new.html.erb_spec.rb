require 'capybara/rspec'
require 'rails_helper'

# RSpec.describe "urls/new.html.erb", type: :view do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

	describe 'generate short url' do
		#before everything
		before :each do
			#go to urls/new page
			visit new_url_path
			#in the form
			within('form') do
				#enter long url
				fill_in("Long URL", with: "https://google.com")
				#click the button
				click_button('Get Short Url!')
			end
		end

		it "goes to index page after clicking the button" do
			visit urls_path
			expect(page).to have_content('https://google.com')
		end
	end

