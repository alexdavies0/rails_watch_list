class BookmarksController < ApplicationController
  # before_action :find_movie

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    if @bookmark.save!
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  private

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
