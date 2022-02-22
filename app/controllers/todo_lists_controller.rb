class TodoListsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:star]

  def index
    @todo_lists = TodoList.all.order(starred: :desc)
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new(todo_list_params)

    if @todo_list.save
      redirect_to todo_lists_url
    else
      redirect_to new_todo_list_url
    end
  end

  def star
    todo_list = TodoList.find(params[:todo_list_id])
    if todo_list.present?
      todo_list.update(starred: !todo_list.starred)

      msg = { status: :ok, success: :true }
    else
      msg = { status: :not_found, success: :false }
    end
    render json: msg
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
