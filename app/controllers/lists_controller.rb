class ListsController < ApplicationController

  before_action :find_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path(@list)
  end

  private

    def find_list
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:name)
    end
end
