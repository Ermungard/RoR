class Article < ApplicationRecord

	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
	has_many :comments, dependent: :destroy
  	validates :title, presence: true, length: { minimum: 1, maximum: 70 }


    def all_tags
    	self.tags.map(&:name).join(', ')
    end

    def all_tags=(names)
    	self.tags = names.split(',').map do |name|
    		Tag.where(name: name.strip).first_or_create!
    	end
    end
end