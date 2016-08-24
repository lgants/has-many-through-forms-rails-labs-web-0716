class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  # , reject_if: proc { |attr| attr['username'].blank? }

# prevents duplication if new category matches an existing category
  # def category_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_or_create_by(category_attribute)
  #     self.categories << category
  #   end
  # end

  def commenters
    self.comments.collect {|comment| comment.user}
  end

end
