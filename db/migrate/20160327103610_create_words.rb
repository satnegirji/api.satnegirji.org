class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :body, null: false
      t.string :keyword, null: false
      t.integer :language_id, default: 0, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :words, [:keyword, :language_id]
  end
end
