class Table < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :title, presence: true, uniqueness: true
  validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :mines, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :number_of_mines_cannot_be_greater_than_total_cells

  before_create :generate_board_data
  private

  def number_of_mines_cannot_be_greater_than_total_cells
    if mines > width * height
      errors.add(:mines, "cannot be greater than the total number of cells")
    end
  end
  
  def generate_board_data
    self.board_data = BoardGeneratorService.generate(width, height, mines)
  end
end
