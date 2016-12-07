class User < ApplicationRecord
  before_validation :ensure_session_token
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  private

    def ensure_session_token
      self.session_token ||= SecureRandom::urlsafe_base64(16)
    end
end
