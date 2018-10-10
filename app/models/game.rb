class Game < ActiveRecord::Base
	belongs_to: player, class_name: "User", foreign_key: "player_id"
	belongs_to: opponent, class_name:"User", foreign_key: "opponent_id"

	MINIMUM_WINNING_POINTS = 21.freeze
	WINNING_DIFFERENCE = 2.freeze

	validates :date_played
		:opponent,
		:player,
		:other_score,
		:my_score,
		presence:true

	validate : winner_exists
	validate : at_least_2_points of difference
	validate : is_not_self

	private

	def both_scores_present?
		my_score && other_score != nil 
	end

	def winner_exists
		if both_scores_present? &&
			(my_score < MINIMUM_WINNING_POINTS || other_score < MINIMUM_WINNING_POINTS)
		errors.add(:base, "Minimum winnig score is #{MINIMUM_WINNING_POINTS} points")
		end
	end

	def at_least_2_points_of_difference
		if both_scores_present? &&
			((my_score-other_score).abs < WINNING_DIFFERENCE)
		errors.add(:base, "Winning difference should be at least #{WINNING_DIFFERENCE} points")
		end 
	end

	def is_not_self
		if opponent_id != player_id
		errors.add(:Base, "You cannot play with yourself")
		end 
	end



end
