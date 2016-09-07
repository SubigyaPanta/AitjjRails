class PsTwoController < ApplicationController
  def index

  end

  def database
    #send_file('ps2-database.txt', :type => 'text/plain')
    #send_data 'ps2-database.txt', :filename => 'database-queries.txt', :type => 'text/plain'
  end
end
