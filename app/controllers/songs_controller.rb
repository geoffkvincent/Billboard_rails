class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, except: [:index, :new, :create]

  def index
    @songs = @artist.topics
  end

  def show
  end

  def new
    @song = @artist.song.new
    render partial: "form"
  end

  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to artist_song_path(@artist, @song.id)
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist, @song)
      # redirect_to [@sub, @topic]
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to sub_topics_path
  end

  private
    def set_artist
      @artist= Artist.find(params[:artist_id])
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :album)
    end    
end