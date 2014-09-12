require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User browses the list of links" do

	before(:each) {
		sign_up('test@test.com', 'test', 'test')
		click_button 'Sign out'
		sign_up('rupert@test.com', 'rupert', 'rupert')
		Link.create(:url => "http://www.makersacademy.com",
					:title => "Makers Academy",
					:tags => [Tag.first_or_create(:text => 'education')],
					:users => [ User.first( :email => 'test@test.com' ) ])
		Link.create(:url => "http://www.google.com",
					:title => "Google",
					:tags => [Tag.first_or_create(:text => 'search')],
					:users => [ User.first( :email => 'test@test.com' ) ])
		Link.create(:url => "http://www.bing.com",
					:title => "Bing",
					:tags => [Tag.first_or_create(:text => 'search')],
					:users => [ User.first( :email => 'rupert@test.com' ) ])
		Link.create(:url => "http://www.code.org",
					:title => "Code.org",
					:tags => [Tag.first_or_create(:text => 'education')],
					:users => [ User.first( :email => 'rupert@test.com' ) ])
	}

	scenario "when opening the home page" do
		visit '/'
		expect(page).not_to have_content("Makers Academy")
		expect(page).to have_content("Code.org")
		expect(page).not_to have_content("Google")
		expect(page).to have_content("Bing")
	end

	scenario "filtered by a tag" do
		visit '/tags/search'
		expect(page).not_to have_content("Makers Academy")
		expect(page).not_to have_content("Code.org")
		expect(page).not_to have_content("Google")
		expect(page).to have_content("Bing")
	end

	scenario "sees no links when not signed in" do
		visit '/'
		click_on 'Sign out'
		expect(page).not_to have_content("Makers Academy")
		expect(page).not_to have_content("Code.org")
		expect(page).not_to have_content("Google")
		expect(page).not_to have_content("Bing")
	end
end