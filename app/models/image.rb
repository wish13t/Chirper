class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  embedded_in :blog

  # Define your image attributes and validations here
  has_mongoid_attached_file :file, styles: { thumb: "100x100>" }

  validates_attachment :file, presence: true,
    content_type: { content_type: ["image/jpeg", "image/png"] },
    size: { less_than: 5.megabytes }


end