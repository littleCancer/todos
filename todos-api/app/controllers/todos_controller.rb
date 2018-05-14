class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :update, :destroy]

  # show all - get
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  # create todo - post
  def create
    puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& todo create'
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # single todo details - get todos/:id
  def show
    json_response(@todo)
  end

  # update todo - put todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  #delete todo - delete todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end


  private

  def todo_params
    #white list params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

end
