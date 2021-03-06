class Article < ApplicationRecord
  #has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  validates :title, presence: true,
                    length: {minimum: 2}
  belongs_to :user

  def tag_list
  #   self.tags.collect do |tag|
  #     tag.name
    tags.join(",")
  #   end.join(",")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
