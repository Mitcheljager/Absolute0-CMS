class PagesController < ApplicationController
  def index
    @pages = Page.all.order(created_at: :desc)
  end

  def show
    @page = Page.find(params[:id])
    @blocks = Block.where(page_id: params[:id]).all
    @columns = Column.where(block_id: params[:id]).all
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
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
      render 'index'
    else
      render 'new'
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
