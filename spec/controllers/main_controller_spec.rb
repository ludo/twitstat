require 'spec_helper'

describe MainController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'hashtags'" do
    it "should be successful" do
      get 'hashtags'
      response.should be_success
    end
  end

end
