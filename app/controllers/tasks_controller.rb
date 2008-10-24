require 'uuidtools'

class TasksController < ApplicationController
  layout 'default'
  protect_from_forgery :except => [:set_task_name]
  
  def index
    @tasks = Task.find(:all)
  end
  
  def create
    @task = Task.new(params[:task])     
    @task.Id = UUID.random_create
    @task.save  
    redirect_to :action => :index
  end
  
  def set_task_name
    task = Task.find(params[:id])
    task.name = params[:value]
    task.save
    render :text => task.name, :layout => false
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :action => :index
  end
end
