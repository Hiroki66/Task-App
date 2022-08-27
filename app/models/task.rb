class Task < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, uniqueness: true
  validates :detail, presence: true, length: { minimum: 5 }

end
