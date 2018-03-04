class Micropost < ApplicationRecord
  #記事からユーザーへ１対１の関連付け
  belongs_to :user
  #default_scopeを使って記事の表示順を最新順に変更（降順）
  default_scope -> { order('created_at DESC')}


#バリデーション設定
  #記事を保存するためにはcontent(内容)が空だと保存不可、更に140文字以上はダメです
  validates :content, presence: true, length: { maximum: 140 }
  #記事を保存するためにはuser_idを持っていないと保存出来ない
  validates :user_id, presence: true
end
