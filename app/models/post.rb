class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
  validates :views, presence: true



  def increment_view
   self.increment!(:views)
  end


end
