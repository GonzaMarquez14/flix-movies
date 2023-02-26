class GenresController < ApplicationController
    before_action :require_admin, only: [:create, :update, :destroy]
    before_action :set_genre, only: [:show, :edit, :update, :destroy]

    def index
        @genres = Genre.all
    end

    def show
        @movies = @genre.movies
    end

    def new
        @genre = Genre.new
    end

    def edit
        
    end

    def create
        @genre = Genre.new(genre_params)

        if @genre.save
            redirect_to @genre, notice: "Genre Successfully created!"            
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @genre.update(genre_params)
            redirect_to @genre, notice: "Genre successfully updated!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @genre.destroy

        redirect_to genres_url, status: :see_other,
            danger: "Genre Successfully deleted!"
    end

    private

    def set_genre
        @genre = Genre.find(params[:id])
    end

    def genre_params
        params.require(:genre).permit(:name, movie_ids: [])
    end
end
