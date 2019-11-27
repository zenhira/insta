class User < ApplicationRecord
  mount_uploader :user_image, ImageUploader
    has_many :feed
    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                    before_validation { email.downcase! }
                    has_secure_password

                    has_many :favorites
                    # has_many :favposts, through: :favorites, source: :feed
                  
  validates :password, presence: true, length: { minimum: 6 }


  def like(feed)
    favorites.find_or_create_by(feed_id: feed.id)
  end

  def unlike(feed)
    favorite = favorites.find_by(feed_id: feed.id)
    favorite.destroy if favorite
  end

  # def  favpost?(feed)
  #   self.favposts.include?(feed)
  # end
end
