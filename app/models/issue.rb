class Issue < ApplicationRecord
  belongs_to :user

  enum :frequency, { once: 0, recurrent: 1 }

  validates :frequency, presence: true
  validates :address, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true
end
