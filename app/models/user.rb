class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :languages, presence: true

  validates :username, presence: true
  validates :username, uniqueness: true 

  validates_format_of :email, {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "does not look like a valid email address"
  }

  validates :password, length: { is: 8, message: "must be at least 8 characters" }
end
