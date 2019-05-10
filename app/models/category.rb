class Category < ApplicationRecord
    has_many :website_pages
    belongs_to :gender
end
