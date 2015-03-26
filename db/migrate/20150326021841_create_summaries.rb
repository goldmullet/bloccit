class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.posts :

      t.timestamps null: false
    end
  end
end
