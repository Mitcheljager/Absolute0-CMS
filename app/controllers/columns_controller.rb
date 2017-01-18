class ColumnsController < ApplicationController

  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)

    if @column.save
      flash[:notice] = 'Column successfully created'
    else
    end
  end

  def edit
  end

  def show
  end

  def list
    @columns = Column.all
  end

  private

  def column_params
    params.require(:column).permit(:block_id, :size)
  end
end
