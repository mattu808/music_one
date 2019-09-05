class RankingsController < ApplicationController
  before_action :set_course

  def index
    @teachers = @artist.rankings.where(role: 'teacher')
    @tas = @artist.rankings.where(role: 'ta')
    @students = @artist.rankings.where(role: 'student')
  end

  def new
    @ranking = @artist.rankings.new
  end

  def create
    @ranking = @artist.rankings.new(ranking_params)
    if @ranking.save
      redirect_to artist_rankings_path(@artist)
    else
      render :new
    end
  end

  def destroy
    @ranking = @artist.rankings.find(params[:id])
    @ranking.destroy
    redirect_to artist_rankings_path(@artist)
  end

 private
   def set_artist
     @artist = Artist.find(params[:artist_id]) 
   end

   def ranking_params
     params.require(:ranking).permit(:role, :user_id)
   end
end
