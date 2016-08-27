class YoutubeController < ApplicationController
  def fetch
    #require 'rubygems'
    #require 'nokogiri'
    require 'open-uri'
    @page = Nokogiri::HTML(open('https://www.youtube.com/feed/trending'),nil,"UTF-8")

  end
end
