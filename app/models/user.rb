class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {user:0, vr_person:1, admin:2}
# :avatarの部分は用途に合わせて :image :photoでも可
  has_one_attached :avatar

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  #指定のユーザをフォローする
def follow!(other_user)
  active_relationships.create!(followed_id: other_user.id)
end

#フォローしているかどうかを確認する
def following?(other_user)
  active_relationships.find_by(followed_id: other_user.id)
end

def unfollow!(other_user)
  active_relationships.find_by(followed_id: other_user.id).destroy
end

end
