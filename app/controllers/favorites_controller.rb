class FavoritesController < ApplicationController
    before_action :require_signin
    before_action :set_movie

    def create
        # First Approach
        # @movie.favorites.create!(user: current_user)

        # Second Approach
        # @movie.fans << current_user

        # With Custom Validation if exists. Instead of trusting the UI
        @movie.fans << current_user unless @movie.fans.include? current_user
        
        redirect_to @movie
    end

    def destroy
        @favorite = current_user.favorites.find(params[:id])
        @favorite.destroy
        redirect_to @movie
    end

    private

    def set_movie
        @movie = Movie.find(params[:movie_id])
    end
end
