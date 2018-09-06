class SongsController < ApplicationController
  before_action :song_called#, :set_artist
  before_action :set_song, except: [:index, :new, :create]

  def index
    @songs = @song_called.songs
  end

  def show
  end

  def new
    @song = @song_called.songs.new
    #render partial: "form"
  end

  def create
    @song = @song_called.songs.new(song_params)
    
    if @song.save
      redirect_to [song_called]
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @song.update(song_params)
      redirect_to [song_called]
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to [song_called]
  end

  protected
  def song_called
    @song_called ||=
      if params[:billboard_id]
        Billboard.find(params[:billboard_id])
      elsif params[:artist_id]
        Artist.find(params[:artist_id])
      end
  end
  
  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :album, artist_attributes: [:id,:name])
    end 
       
end