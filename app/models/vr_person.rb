class VrPerson < ApplicationRecord
  belongs_to :user
  # :avatarの部分は用途に合わせて :image :photoでも可
  has_one_attached :avatar
end
