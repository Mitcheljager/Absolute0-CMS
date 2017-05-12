class WebsiteSettingsController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      flash[:notice] = 'Website successfully saved'
  end

  private

  def menu_params
    params.require(:website_settings).permit(:homepage_id)
  end
end
