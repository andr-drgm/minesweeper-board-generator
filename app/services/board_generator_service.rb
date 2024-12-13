class BoardGeneratorService
  def self.generate(width, height, mines)
    board = Array.new(height) { Array.new(width, 0) }

    mine_positions = []
    (0...height).each do |row|
      (0...width).each do |col|
        mine_positions << [row, col]
      end
    end

    mine_positions = mine_positions.sample(mines)

    mine_positions.each do |position|
      row = position[0]
      col = position[1]
      board[row][col] = 1
    end

    board.to_json
  end
end 