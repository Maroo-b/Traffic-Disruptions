class MapsController < ApplicationController

  def show
    @pins = GetTrafficDisruptions.call
  end
  
end
