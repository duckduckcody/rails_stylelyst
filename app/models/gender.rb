class Gender < ApplicationRecord
    has_many :website_pages
    has_many :categories
end
