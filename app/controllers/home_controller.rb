class HomeController < ApplicationController
  
  def index
  end
  
  def show
    if user_signed_in?
      @markers = current_user.markers.all

      if @markers.empty?
        @flati = 0
        @flong = 0
      else
        @flati = @markers.first.lati
        @flong = @markers.first.long
      end
    end
  end
  
end
