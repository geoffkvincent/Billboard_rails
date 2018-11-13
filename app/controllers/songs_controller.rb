class SongsController < ApplicationController
  before_action :song_called
  before_action :set_song, except: [:index, :new, :create]

  def index
    @songs = @song_called.songs.order("created_by ASC")
  end

  def show
  end

  def new
    @artists = Artist.all
    
    @song = @song_called.songs.new
    #render partial: "form"
    if @song.artist_id.nil?
      @artist = Artist.new
   end
    
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
    @artists = Artist.all
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
      params.require(:song).permit(:title, :album, :artist_id)
    end 
       
end