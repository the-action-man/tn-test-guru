class Test < ApplicationRecord
  def self.by_category(category)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { name: category })
      .order(name: :desc)
      .pluck(:name)
  end
end
