class SongsController < ApplicationController

  def destroy
    Song.find(params[:id]).destroy
    redirect_to song_url
  end

private
def song_params(*args)
  params.require(:song).permit(*args)
end
  
end
