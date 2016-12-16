class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, :presence => true)
  before_save(:capitalize_name)


private

  def capitalize_name
    store_name = self.name.split
    new_name = store_name.map { |store| store.capitalize }
    self.name = new_name.join(' ')
  end


end
