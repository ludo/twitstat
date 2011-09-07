class AddCountToKeyword < ActiveRecord::Migration
  def change
    add_column :keywords, :count, :integer, :default => 0
  end
end
