require "test_helper"

class TableTest < ActiveSupport::TestCase
  test "should not save table without required attributes" do
    table = Table.new
    assert_not table.save
  end

  test "should not allow mines greater than board size" do
    table = Table.new(
      email: "test@example.com",
      title: "Test Board",
      width: 5,
      height: 5,
      mines: 30
    )
    assert_not table.save
    assert_includes table.errors[:mines], "cannot be greater than the total number of cells"
  end

  test "should create valid table" do
    table = Table.new(
      email: "test@example.com",
      title: "Test Board",
      width: 5,
      height: 5,
      mines: 5
    )
    assert table.save
  end
end
