class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, presence: true
  has_many :tasks
end
