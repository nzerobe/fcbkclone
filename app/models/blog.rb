class Blog < ApplicationRecord
  
  validates :content, length: { in: 1..140 }
    validates :title, presence: true
    validates :image, presence: true

 mount_uploader :image, ImageUploader
  
  belongs_to :user
end
