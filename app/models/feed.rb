class Feed < ApplicationRecord
    belongs_to :user
    validates :image, presence: true
    mount_uploader :image, ImageUploader
    has_many :favorites, foreign_key: 'feed_id', dependent: :destroy
    has_many :users, through: :favorites
end
