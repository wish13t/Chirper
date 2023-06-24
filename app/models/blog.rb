class Blog
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :user_id, type: Integer

  belong_to :user
  validates :content, length: { maximum: 1400 }
                      presence: true
end
