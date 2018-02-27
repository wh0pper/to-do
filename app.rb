require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('pry')
also_reload('lib/**/*.rb')
require('pg')
require './lib/list'
require './lib/task'

get('/') do
  @lists = List.all
  erb(:index)
end

post('/') do
  List.create({:name => params[:list_name], :description => params[:list_description]})
  @lists = List.all
  erb(:index)
end

get('/list/:id') do
  id = params.fetch("id")
  @not_done_tasks = Task.where(done: false, list_id: id)
  @list = List.find(id)
  erb(:list)
end

post('/list/:id') do
  id = params.fetch("id")
  @list = List.find(id)
  time = params[:hour] + ":" + params[:minute] + " " + params[:ampm]
  Task.create({:description => params[:task_description], :done => false, :list_id => id, :date => params[:date], :time => time})
  @not_done_tasks = Task.where(done: false, list_id: id)
  erb(:list)
end

patch('/list/:id') do
  checkboxes = params.fetch("checkboxes")
  checkboxes.each do |taskid|
    this_task = Task.find(taskid)
    this_task.update({:done => true})
  end
  id = params.fetch("id")
  @list = List.find(id)
  @not_done_tasks = Task.where(done: false, list_id: id)
  erb(:list)
end

delete('/list/:id') do
  id = params.fetch("id")
  @list = List.find(id)
  @list.destroy
  @lists = List.all
  erb(:index)
end
