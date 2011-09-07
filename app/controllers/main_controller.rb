class MainController < ApplicationController
  rescue_from Twitter::NotFound, :with => :username_not_found

  def index
  end

  def hashtags
    
    @screen_name = params[:screen_name]
    
    
    
    @timeline = Twitter.user_timeline(@screen_name)
    
    save_keyword(true)
    
    @hashtags = []
    
    @timeline.each do |tweet| 
     @hashtags.concat Twitter::Extractor.extract_hashtags(tweet.text)
    end
    
  end
  
  
  
  private
  
  def save_keyword(found)
    @keyword = Keyword.find_or_initialize_by_value(@screen_name)
    @keyword.found = found
    @keyword.count += 1
    @keyword.save 
  end  
  
  def username_not_found
    
    save_keyword(false)
    logger.error "username does not exist: #{@screen_name}"
    redirect_to( { :action => :index }, :alert => "username does not exist: #{@screen_name}")
  end

end
