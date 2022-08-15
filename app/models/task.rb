class Task < ApplicationRecord
  belongs_to :user
  
  validates :task, presence: true
  validates :detail, presence: true, length: { minimum: 5 }

end
