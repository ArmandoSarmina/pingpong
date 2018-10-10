require 'test_helper'

class GameTest < ActiveSupport::TestCase

	player = User.new(email: 'user1@gmail.com')
	opponent = User.new(email: 'user2@gmail.com')
	default_values = {
		date_played: Date.today,
		opponent: opponent,
		other_score: 21,
		my_score: 18
	}
	test "requires other score" do
		game = Game.new(default_values)
		game.other_score = nil
		assert false
		assert_equal(game.errors[:other_score],["can't be blank" ])
	end

     # test "the truth" do
  #   assert true
  # end
end
