require 'sinatra'
require 'json'
require_relative 'lib/db_initializer.rb'
class View < Sinatra::Base
  get '/' do
    erb :index
    end

  get '/generate' do
    dbb = SQLite3::Database.new("db/database.db")
    x = params[:x]
    y = params[:y]
    DBInitialiser.initialise_DB("db/database.db")
    case x
    when "Block Height"
      xq = "height"
    when "Transaction Count"
      xq = "tx_count"
    when "Fee"
      xq = "fee"
    when "Difficulty"
      xq = "difficulty"
    when "Reward"
      xq = "reward"
    when "Size"
      xq = "size"
    when "Time"
      xq = "time"
    when "Bits"
      xq = "bits"
    else
      xq = "height"
    end

    case y
    when "Block Height"
      yq = "height"
    when "Transaction Count"
      yq = "tx_count"
    when "Fee"
      yq = "fee"
    when "Difficulty"
      yq = "difficulty"
    when "Reward"
      yq = "reward"
    when "Size"
      yq = "size"
    when "Time"
      yq = "time"
    when "Bits"
      yq = "bits"
    else
      yq = "height"
    end

    array = dbb.execute("SELECT #{xq} , #{yq} FROM blocks")
  keys = Struct.new(:x , :y)
   array.map do |x,y|
   keys.new(*x, *y).to_h
  end
  @data = JSON[array]
  @label = "#{y} over #{x}"
  @y = y
  @x = x

    erb :chart

  end

end
