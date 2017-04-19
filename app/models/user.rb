class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :username, presence: true
  validates :email, uniqueness: true
  has_many :projects
  has_many :tasks, through: :projects
  has_secure_password

  def full_name
    first_name + " " + last_name
  end
end
