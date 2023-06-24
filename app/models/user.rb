class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String

  has_many :blogs
  validates :name, presence: true
  validates :email, presence: true
end
