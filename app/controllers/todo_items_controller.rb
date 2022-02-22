class TodoItemsController < ApplicationController
  def create
    @todo_item = TodoItem.new(todo_item_params)

    if @todo_item.save
      redirect_to todo_lists_url
    else
      redirect_to todo_lists_url
    end
  end

  private

  def todo_item_params
    params.require(:todo_item).permit(:content, :todo_list_id)
  end
end
