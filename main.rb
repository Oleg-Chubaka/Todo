require 'sinatra'
require 'sinatra/activerecord'
require './models/todo'
require 'time'

set :database, "sqlite3:todo.sqlite3"

before do
  @skoba = '/images/skoba.png'
end

before /\/todos\/(\d+)(\/(edit|destroy))?/ do |id, a, b|
  @todo = Todo.find(id)
end

get '/todos' do
  @todos = Todo.all
  haml :'todos/index'
end

get '/todos/new' do
  @todo = Todo.new
  haml :'todos/edit'
end

post '/todos' do
  @todo = Todo.create(title: params[:title], term: params[:term], complite: params[:complite])
  @todo.save
  redirect '/todos'
end

get '/todos/:id/edit' do
  haml :'todos/edit'
end

post '/todos/:id' do
  @todo.update(title: params[:title], term: params[:term], complite: params[:complite])
  @todo.save
  redirect '/todos'
end

get '/todos/:id/destroy' do
  @todo.destroy
  redirect '/todos'
end

helpers do

end