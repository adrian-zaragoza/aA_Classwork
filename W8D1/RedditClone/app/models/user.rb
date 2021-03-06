class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  has_many :subs_created,
    class_name: "Sub",
    foreign_key: :creator_id

  has_many(
    :posts,
    class_name: :Post,
    foreign_key: :author_id
  )

  after_initialize :ensure_session_token
  attr_reader :password

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)

    if @user && @user.is_password?(password)
      return @user
    else
      return nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end




