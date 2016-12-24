class BlocksController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  def list
    @blocks = Block.all
  end
end
