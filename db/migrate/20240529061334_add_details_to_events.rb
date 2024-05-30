class AddDetailsToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :name, :string
    add_column :events, :location, :string
    add_column :events, :description, :text
  end
end
