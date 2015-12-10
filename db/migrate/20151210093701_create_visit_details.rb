class CreateVisitDetails < ActiveRecord::Migration
  def change
    create_table :visit_details do |t|
      t.string :ip_address
      t.string :referer
      t.string :browser_details
      t.timestamps null: false
    end
  end
end
