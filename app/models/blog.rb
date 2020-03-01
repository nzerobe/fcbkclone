class Blog < ApplicationRecord
  
  belongs_to :user           
   mount_uploader :image, ImageUploader
  validates :content, length: { in: 1..140 }
  validates :title, presence: true
  validates :image, presence: true

  
  
  
end
