class Reply < ApplicationRecord
  belongs_to :post,optional: true
  belongs_to :user,optional: true
  belongs_to :comment,optional: true
end
