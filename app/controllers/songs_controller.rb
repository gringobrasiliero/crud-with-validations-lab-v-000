class SongsController < ApplicationController

def index
  @songs = Song.all
end

  def create
    @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
    redirect_to song_path(@song)
  end




  def destroy
    Song.find(params[:id]).destroy
    redirect_to song_url
  end

private
def song_params(*args)
  params.require(:song).permit(*args)
end

end
