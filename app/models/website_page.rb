class WebsitePage < ApplicationRecord
  belongs_to :gender
  belongs_to :category
  belongs_to :website
end
