class ComponentsController < ApplicationController
  def new
  end

  def edit
  end

  def template
    @component = Component.find(params[:id])
  end

  def list
    @components = Component.all
  end
end
