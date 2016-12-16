class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  before_save(:capitalize_name)


private

  def capitalize_name
    brand_name = self.name.split
    new_name = brand_name.map { |brand| brand.capitalize }
    self.name = new_name.join(' ')
  end


end
