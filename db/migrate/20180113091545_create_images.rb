class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :author
      t.text :image
      t.text :content
      t.timestamps
    end
  end
end
