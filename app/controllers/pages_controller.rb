class PagesController < ApplicationController
  before_action :authorize, except: [:show]

  def index
    @pages = Page.all.order(created_at: :desc)
    @page = Page.new
    @block = Block.new
    @column = Column.new
    @component = Component.new
  end

  def show
    @page = Page.find(params[:id])
    @blocks = Block.where(page_id: params[:id]).all
    @columns = Column.all
    @components = Component.all
  end

  def home
    @website_setting = WebsiteSetting.first
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
    @pages = Page.all
  end

  def template
    @page = Page.find(params[:id])
    @blocks = Block.where(page_id: params[:id]).all
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

  private

  def page_params
    params.require(:page).permit(:title)
  end
end
