require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug" if development?
require "sqlite3"
require "active_support/inflector"
require "open-uri"
require "json"


DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), 'db/jukebox.sqlite'))

get "/" do
  # TODO:
  @message = "Build whatever you want 🙌🏻"
  erb :home
end

post "/things" do
  query = params[:query]
  url = "https://api.github.com/users/#{query}"
  user = JSON.parse(URI.open(url).read)
  
  # binding.pry

  erb :home
end
