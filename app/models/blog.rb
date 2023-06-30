class Blog
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Timestamps::Created
  include CarrierWave::Mongoid

  field :title, type: String
  field :content, type: String

  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, BlogPost::ImageUploader
  belongs_to :user
  validates :user_id, presence: true
  validates :content, length: { maximum: 1400 }, presence: true
  validate :image_size

  private

  # Validates the size of an uploaded image.
  def image_size
    return if image.nil?
    if image.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end