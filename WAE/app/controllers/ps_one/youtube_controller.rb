class PsOne::YoutubeController < ApplicationController
  def fetch
    #require 'rubygems'
    #require 'nokogiri'
    require 'open-uri'
    page = Nokogiri::HTML(open('https://www.youtube.com/feed/trending'),nil,"UTF-8")
    @trending = page.css('a.yt-uix-sessionlink.yt-uix-tile-link.yt-ui-ellipsis.yt-ui-ellipsis-2.spf-link').take(10);
  end
end
