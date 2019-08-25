class Blog < ApplicationRecord
    enum status: { draft: 0, published:1 }
    extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope {order(created_at: :desc)}
  
  validates_presence_of :title, :body, :topic_id
  
  belongs_to :topic
  
  has_many :comments, dependent: :destroy
  
  def self.featured_blogs
    limit(2)
  end
end
