class WebsiteSettingsController < ApplicationController
  def new
    @website_setting = WebsiteSetting.new
  end

  def create
    @website_setting = WebsiteSetting.new(website_setting_params)

    if @website_setting.save
      flash[:notice] = 'Website successfully saved'
  end

  private

  def website_setting_params
    params.require(:website_settings).permit(:homepage_id)
  end
end
