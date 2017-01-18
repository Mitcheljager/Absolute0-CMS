class BlocksController < ApplicationController

  def new
    @block = Block.new
  end

  def create
    @block = Block.new(block_params)

    if @block.save
      flash[:notice] = 'Block successfully created'
    else
    end
  end

  def edit
  end

  def show
  end

  def list
    @blocks = Block.all
  end

  private

  def block_params
    params.require(:block).permit(:page_id)
  end
end
