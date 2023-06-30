class Blog
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Timestamps::Created
  field :title, type: String
  field :content, type: String
  field :image, type: String

  default_scope -> { order(created_at: :desc) }

  # mount_uploader :image, ImageUploader

  belongs_to :user
  validates :user_id, presence: true
  validates :content, length: { maximum: 1400 }, presence: true
  validate  :image_size

  private

    # Validates the size of an uploaded image.
    def image_size
      return if image.nil?
      if image.size > 105.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
