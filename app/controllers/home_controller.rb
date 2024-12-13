class HomeController < ApplicationController
  def index
    @table = Table.new
    @tables = Table.order(created_at: :desc).limit(10)
  end
end
