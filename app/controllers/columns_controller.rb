class ColumnsController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  def list
    @columns = Column.all
  end
end
