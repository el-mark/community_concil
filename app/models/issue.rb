class Issue < ApplicationRecord
  belongs_to :user

  enum :frequency, { once: 0, recurrent: 1 }

  FREQUENCY_LABELS = { "once" => "Una vez", "recurrent" => "Recurrente" }.freeze

  validates :frequency, presence: true
  validates :address, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true

  def self.frequency_options
    frequencies.keys.map { |key| [FREQUENCY_LABELS.fetch(key), key] }
  end

  def frequency_label
    FREQUENCY_LABELS.fetch(frequency, frequency)
  end
end
