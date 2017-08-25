class Post < ApplicationRecord
   validates :post,presence: true
   belongs_to :user
   has_many :comments
   has_many :photos , as: :photoable, :dependent => :destroy
   has_many :likes , as: :likeable, :dependent => :destroy
   has_many :replies ,dependent: :destroy
   accepts_nested_attributes_for :photos, :allow_destroy => true
   
end
