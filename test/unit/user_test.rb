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
		user = User.new
		user.profile = "My Profile with Spaces"

		assert !user.save
		assert !user.errors[:profile].empty?
		assert user.errors[:profile].include?("Must be formatted correctly.")
	end

end
