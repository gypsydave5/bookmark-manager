require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs up" do

	#Strictly speaking, the tests that check the UI (have content, etc.) should be separate from the test that check what we have in the DB. The reason is that you should rest on thing at a time, whereas by mixing the two we're testing both the business logic and the views.

	#However, let's not worry about this yet to keep the example simple.

	scenario "when being logged out" do
		expect{sign_up}.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, alice@example.com")
		expect(User.first.email).to eq("alice@example.com")
	end

	scenario "with a password that doesn't match" do
		expect{ sign_up('a@a.com', 'pass', 'wrong')}.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end

	scenario "with an email that is already registered" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect{ sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("This email is already taken")
	end
end


feature "User sign in" do

	background(:each) do
		User.create( email: "test@test.com",
							   password: "test",
							   password_confirmation: "test"	)
	end

	scenario 'with correct credentials' do
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in('test@test.com', 'test')
		expect(page).to have_content("Welcome, test@test.com")
	end

	scenario "with incorrect credentials" do
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in('test@test.com', 'wrong')
		expect(page).not_to have_content("Welcome, test@test.com")
	end
end

feature 'User signs out' do
	background(:each) do
		User.create( email: "test@test.com",
							   password: "test",
							   password_confirmation: "test"	)
	end

	scenario 'while being signed in' do
		sign_in('test@test.com', 'test')
		click_button "Sign out"
		expect(page).to have_content("Good bye!")
		expect(page).not_to have_content("Welcome, test@test.com")
	end
end

feature 'User forgest password' do

	background(:each) do
		User.create( email: "test@test.com",
					password: "test",
					password_confirmation: "test",
					password_token: "ecrtfvygbhuj5678"	)
	end

	scenario "and requests password reset" do
		visit '/sessions/new'
		click_link 'Forgot your password?'
		expect(current_path).to eq('/sessions/recovery')
		expect(page).to have_content("Please enter your email")
		fill_in 'email', with: "test@test.com"
		click_button "Recover password"
		expect(page).to have_content("Please check your email for a link to reset your password")
	end

	scenario "and follows reset link" do
		visit "sessions/recovery/ecrtfvygbhuj5678"
		expect(page).to have_content("Hellow test@test.com!")
		expect(page).to have_content("Please enter new password")
		fill_in 'password', with: "1234"
		fill_in 'password_confirmation', with: "1234"
		click_button 'Enter'
		expect(current_path).to eq('/')
		expect(page).to have_content("Password reset successfully!")
		expect(page).to have_content("Welcome, test@test.com")
	end
end