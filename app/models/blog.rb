class Blog
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Timestamps::Created
  include Mongoid::Paperclip

  embeds_many :images, cascade_callbacks: true
  accepts_nested_attributes_for :images
  validates :user_id, presence: true
  validates :content, length: { maximum: 1400 }, presence: true
  validate :image_size
  field :title, type: String
  field :content, type: String

  default_scope -> { order(created_at: :desc) }

  belongs_to :user

  private

  # Validates the size of an uploaded image.
  def image_size
    return if images.nil?
    if images.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end