require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do
		it "should have the content 'NOS Management System'" do
			visit static_pages_home_path
			expect(page).to have_content('NOS Management System')
		end
	end

	describe "Help page" do
		it "should have the content 'Help'" do
			visit static_pages_help_path
			expect(page).to have_content('Helpful Information')
		end
	end
end
