module V1

  class ItemsController < ApplicationController

    before_action :set_todo

    before_action :set_todo_item, only: [:update, :destroy, :show]


    # GET /todos/:todo_id/items
    def index
      json_response @todo.items
    end

    # GET /todos/:todo_id/items/:id
    def show
      puts "----------------------------------------------- #{@item}"
      json_response @item
    end

    # POST /todos/:todo_id/items
    def create

      mitem_params = item_params

      # puts "********************** ciiiiiiiiiiicko #{@todo.items}  item #{@item} imanema"
      @todo.items.create!(mitem_params)
      json_response @todo, :created
    end

    # PUT  /todos/:todo_id/items/:id
    def update

      if @item.update(item_params)
        head :no_content
      end

    end

    # DELETE /todos/:todo_id/items/:id
    def destroy

      @item.destroy
      head :no_content

    end

    private

    def item_params
      params.permit(:name, :done)
    end

    def set_todo
      puts "========================================== #{params}"
      @todo = Todo.find(params[:todo_id])
    end

    def set_todo_item

      @item = @todo.items.find_by!(id: params[:id]) if @todo
    end

  end


end