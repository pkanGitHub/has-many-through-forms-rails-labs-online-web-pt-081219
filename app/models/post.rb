class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(attrs)
    attrs.values.each do |attr|
      if !attr[:name].empty?
        category = Category.find_or_create_by(attr)
        self.categories << category
      end
    end
  end
end
