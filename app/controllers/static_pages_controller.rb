class StaticPagesController < ApplicationController
  def index
  	
  end
  def home
  	@device = CallApi.new.get_device
  end


end
