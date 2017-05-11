class DisruptionsController < ApplicationController

  def show
    @pins = GetTrafficDisruptions.call
    
    respond_to  do |format|
      format.js
    end
  end
  
end
