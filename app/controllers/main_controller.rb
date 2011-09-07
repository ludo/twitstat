class MainController < ApplicationController
  rescue_from Twitter::NotFound, :with => :username_not_found

  def index
  end

  def hashtags
    
    @screen_name = params[:screen_name]
    @timeline = Twitter.user_timeline(@screen_name)
    @hashtags = []
    
    @timeline.each do |tweet| 
     @hashtags.concat Twitter::Extractor.extract_hashtags(tweet.text)
    end
    
  end
  
  
  def username_not_found
    logger.error "username does not exist: #{@screen_name}"
    redirect_to( { :action => :index }, :alert => "username does not exist: #{@screen_name}")
  end

end
