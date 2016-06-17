require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
	def setup
		michael = users(:michael)
		archer = users(:archer)
		@relationship = Relationship.new(follower_id: michael.id, followed_id: archer.id)
	end

	test "should be valid" do
		assert @relationship.valid?
	end

	test "should require a follower_id" do
		@relationship.follower_id = nil
		assert_not @relationship.valid?
	end

	test "should require a followed_id" do
		@relationship.followed_id = nil
		assert_not @relationship.valid?
  	end
end
