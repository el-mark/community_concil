class User < ApplicationRecord
  has_many :issues, dependent: :destroy

  before_create :generate_verification_token

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  normalizes :email, with: ->(email) { email.strip.downcase }

  def verified?
    verified_at.present?
  end

  def verify!
    update!(verified_at: Time.current)
  end

  private

  def generate_verification_token
    self.verification_token ||= SecureRandom.urlsafe_base64(32)
  end
end
