class Test < ApplicationRecord
  def self.by_category(category)
    id = Category.select(:id).where(name: category)
    self.select(:name).where(category_id: id).order(name: :desc)
  end
end
