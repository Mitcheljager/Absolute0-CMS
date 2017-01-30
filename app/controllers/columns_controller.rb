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
    @columns = Column.all.order(priority: :asc)
  end

  def sort
    params[:order].each do |key, value|
      Column.find(value[:id]).update_attribute(:priority, value[:position])
    end
    render :nothing => true
  end

  private

  def column_params
    params.require(:column).permit(:block_id, :size)
  end
end
