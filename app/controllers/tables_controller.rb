class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update]

  def new
    @table = Table.new
  end

  def edit
  end

  def create
    @table = Table.new(table_params)
      if @table.save
        redirect_to edit_table_path(@table)
      else
        render :new
      end

  end

  def update
      if @table.update(table_params)
        redirect_to edit_table_path(@table)
      else
        render :edit
      end
  end


  private
    def set_table
      @table = Table.find(params[:id])
    end

    def table_params
      params.require(:table).permit(:columns, :list)
    end
end
