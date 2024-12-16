class TablesController < ApplicationController
  rescue_from BoardGeneratorService::GenerationError, with: :handle_generation_error

  def index
    @tables = Table.all
  end

  def create
    @table = Table.new(table_params)

    if @table.save
      redirect_to table_path(@table), notice: "Board created successfully!"
    else
      flash[:alert] = @table.errors.full_messages
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

  def handle_generation_error(error)
    flash[:alert] = "Error generating board: #{error.message}"
    redirect_to root_path
  end

  def table_params
    params.require(:table).permit(:email, :title, :width, :height, :mines)
  end
end
