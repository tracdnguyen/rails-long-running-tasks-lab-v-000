class SongsController < ApplicationController
  require 'csv'
  
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end
Song Clean,ARTIST CLEAN,Release Year,COMBINED,First?,Year?,PlayCount,F*G
  def upload
    CSV.foreach(params[:songs].path, headers: true) do |song|
      Customer.create(song_clean: song[0], artist_clean: song[1], release_year: song[2], combined: song[3], first: song[4], year: song[5], play_count: song[6], fg: song[7])
    end
    redirect_to customers_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

