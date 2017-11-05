require 'sinatra'
require 'sinatra/activerecord'
require './models/todo'
require 'time'

set :database, "sqlite3:todo.sqlite3"
skoba = '/images/skoba.png'
get '/' do
  "Hello World"
end

get '/todos' do
  @skoba = skoba
  @todos = Todo.all
  haml :todos
end

get '/todo_delete/:id' do
  @todo = Todo.find(params[:id])
  @todo.destroy
  redirect '/todos'
end

get '/todo_edit/:id' do
  @skoba = skoba
  @todo = Todo.find(params[:id])
  haml :todo
end

post '/todo/update' do
  @todo = Todo.find(params[:id])
  @todo.update(title: params[:title], term: params[:term])
  @todo.save
  redirect '/todos'
end

helpers do

end