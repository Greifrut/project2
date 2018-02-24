class StaticPagesController < ApplicationController
  def home
  	@micropost = curent_user.microposts.build if signed_in?
  end

  def help
  end

  def about
    #code
  end

  def contact
  end
end
