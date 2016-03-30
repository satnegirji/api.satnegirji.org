class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :original_id, null: false
      t.integer :translation_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :translations, [:original_id, :translation_id]
  end
end
