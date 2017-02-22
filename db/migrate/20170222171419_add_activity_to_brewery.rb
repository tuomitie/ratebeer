class AddActivityToBrewery < ActiveRecord::Migration[5.0]
  def change
    add_column :breweries, :active, :boolean
  end
end
