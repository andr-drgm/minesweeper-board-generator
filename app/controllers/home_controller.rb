class HomeController < ApplicationController
  def index
    @table = Table.new
    @latest_boards = Table.order(created_at: :desc).limit(10)
  end
end
