class AddFoundToKeyword < ActiveRecord::Migration
  def change
    add_column :keywords, :found, :boolean
  end
end
