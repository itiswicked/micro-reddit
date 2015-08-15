class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { in: 2..50 }
  validates :body,  presence: true, length: { maximum: 300 }

end
