require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile].empty?
	end

	test "a user should have a unique profile name" do
		user = User.new
		user.profile = users(:huiwen).profile
		assert !user.save
		assert !user.errors[:profile].empty?
	end

	test "a user should have a profile name without spaces" do
		user = User.new(first_name: 'Hui Wen', last_name: 'Chen', email: 'hikaru@hwdesigns.me')
		user.password = user.password_confirmation = 'afdfhdj'

		assert !user.save
		assert !user.errors[:profile].empty?
		assert user.errors[:profile].include?("Must be formatted correctly.")
	end

	test "a user can have a correctly formatted profile name" do
		user = User.new(first_name: 'Hui Wen', last_name: 'Chen', email: 'hikaru@hwdesigns.me')
		user.password = user.password_confirmation = 'afdfhdj'

		user.profile = 'hikky_1'
		assert user.valid?

	end

end
