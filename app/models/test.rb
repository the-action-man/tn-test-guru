class Test < ApplicationRecord
  def self.by_category(category)
    self.select(:name)
        .joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { name: category })
        .order(name: :desc)
  end
end
