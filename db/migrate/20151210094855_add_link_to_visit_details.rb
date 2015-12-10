class AddLinkToVisitDetails < ActiveRecord::Migration
  def change
    add_reference :visit_details, :link, index: true, foreign_key: true
  end
end
