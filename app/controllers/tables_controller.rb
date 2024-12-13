class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def create
    @table = Table.new(table_params)

    if @table.save
      @table.update(board_data: generate_board(@table.width, @table.height, @table.mines))
      redirect_to table_path(@table), notice: "Board created successfully!"
    else
      flash[:alert] = @table.errors.full_messages
      @latest_boards = Table.order(created_at: :desc).limit(10)
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

  def generate_board(width, height, mines)
    board = Array.new(height) { Array.new(width, 0) }

    mine_positions = (0...width * height).to_a.sample(mines)

    mine_positions.each do |position|
      row = position / width
      col = position % width
      board[row][col] = 1
    end

    board.to_json
  end
end
