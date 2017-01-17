class ComponentsController < ApplicationController
  def new
    @component = Component.new
  end

  def create
    @component = Component.new(component_params)

    if @component.save
      flash[:notice] = 'Component successfully created'
    else
    end
  end

  def edit
  end

  def template
    @component = Component.find(params[:id])
  end

  def list
    @components = Component.all
  end

  private

  def component_params
    params.require(:component).permit(:column_id, :content)
  end
end
