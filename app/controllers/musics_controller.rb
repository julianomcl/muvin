class MusicsController < ApplicationController

  def index
    @musics = Music.all
  end

  def new
    @music = Music.new
  end

  def most_played
    location = Location.new
    location.latitude = params[:location]['latitude']
    location.longitude = params[:location]['longitude']
    @musics = Music.get_embed_most_played(location)
    respond_to do |format|
      format.json { render :musics, status: :accepted, musics: @musics }
      format.js {}
    end
  end

end
