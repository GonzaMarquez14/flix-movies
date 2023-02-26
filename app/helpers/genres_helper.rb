module GenresHelper

    def total_movies_for_genre(genre)
        genre.movies.size
    end
end
