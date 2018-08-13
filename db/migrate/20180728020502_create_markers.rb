class CreateMarkers < ActiveRecord::Migration[5.2]
  def change
    create_table :markers do |t|
      t.float :lati
      t.float :long
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
