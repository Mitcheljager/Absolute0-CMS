class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      flash[:notice] = 'Page successfully created'
    else
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name)
  end
end
