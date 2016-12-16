class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:stores) do |s|
      s.string :name
    end
    create_table(:brands) do |b|
      b.string :name
    end
    create_table(:brands_stores) do |b|
      b.integer :brand_id
      b.integer :store_id
    end
  end
end
