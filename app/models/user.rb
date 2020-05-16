class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
#   dependent: :destroyは、has_manyで使えるオプションです。
# 　1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定です。
# 　この設定では、Userのデータが削除されたとき、そのUserが投稿したコメントデータも一緒に削除されます。

  attachment :profile_image,destroy: false
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true, length: {in: 2..20 }
  # {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum: 50 }
end
