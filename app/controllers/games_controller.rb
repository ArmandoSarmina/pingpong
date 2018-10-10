class GamesController < ApplicationController
	  before_action :set_game, only: [:show, :edit, :update, :destroy]
	
	def index
		
	end
	
	def create 	
		@game= Game.new(game_params)
		@game_player= current_user

		if @game.save 
			redirect_to @game, notice: 'Your game was logged'
		else
			render :new
		end
	end

	def new
	@game = Game.new
	@users_list = User.where.not(id: current_user.id).collect { |p| [ p.email, p.id ] }
	end

private
	def set_game
		@game = Game.find(params[:id])
	end

	def game_params
		params.require(:game).permit(:date_played, :my_score, :other_score, :opponent_id)
	end
end
