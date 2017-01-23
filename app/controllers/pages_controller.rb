class PagesController < ApplicationController
  before_action :authorize, except: [:show, :home]
  layout 'admin', except: [:show, :home]

  def index
    @pages = Page.all.order(priority: :asc)
    @page = Page.new
    @block = Block.new
    @column = Column.new
    @component = Component.new
    @menus = Menu.all
  end

  def show
    @pages = Page.all.order(priority: :asc)
    @page = Page.find(params[:id])
    @blocks = Block.where(page_id: params[:id]).all.order(priority: :asc)
    @columns = Column.all
    @components = Component.all
  end

  def home
    @website_setting = WebsiteSetting.first
    @pages = Page.all.order(priority: :asc)
    @page = Page.find(@website_setting.homepage_id)
    @blocks = Block.all
    @columns = Column.all
    @components = Component.all
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def list
    @pages = Page.all.order(priority: :asc)
    @menus = Menu.all
  end

  def template
    @page = Page.find(params[:id])
    @blocks = Block.where(page_id: params[:id]).all.order(priority: :asc)
    @columns = Column.all
    @components = Component.all
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      flash[:notice] = 'Page successfully updated'
      render 'index'
    else
      render 'edit'
    end
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = 'Page successfully created'
    else
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    flash[:notice] = 'Page successfully deleted'
    render 'index'
  end

  def sort
    params[:order].each do |key, value|
      Page.find(value[:id]).update_attributes(:priority => value[:position], :menu_id => value[:menu_id])
    end
    render :nothing => true
  end

  private

  def page_params
    params.require(:page).permit(:title, :menu_id)
  end
end
