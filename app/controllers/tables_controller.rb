class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def create
    @table = Table.new(table_params)

    if @table.save
      @table.update(board_data: BoardGeneratorService.generate(@table.width, @table.height, @table.mines))
      redirect_to table_path(@table), notice: "Board created successfully!"
    else
      flash[:alert] = @table.errors.full_messages
      @tables = Table.order(created_at: :desc).limit(10)
      redirect_to root_path
    end
  end

  def show
    @table = Table.find(params[:id])
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    redirect_to root_path, notice: "Board was successfully deleted."
  end

  private

  def table_params
    params.require(:table).permit(:email, :title, :width, :height, :mines)
  end
end
