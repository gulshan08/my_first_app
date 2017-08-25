class Comment < ApplicationRecord
 belongs_to :post
 belongs_to :user
 has_many :photos , as: :photoable , :dependent => :destroy
 has_many :likes , as: :likeable, :dependent => :destroy
 has_many :replies ,dependent: :destroy
 accepts_nested_attributes_for :photos ,:allow_destroy => true
end
