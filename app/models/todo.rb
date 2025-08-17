class Todo < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 255 }
  
  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :recent, -> { order(created_at: :desc) }
  
  def toggle_completed!
    update!(completed: !completed)
  end
end
