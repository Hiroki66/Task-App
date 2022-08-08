class Task < ApplicationRecord
  belongs_to :user
  
  validates :task, presence: true
  validates :detail, presence: true, length: { minimum: 5 }

  validate :detail_is_invalid_without_task
  
  def detail_is_invalid_without_task
    errors.add(:task,"を入力してください") if task.blank? && detail.present?
  end
end
