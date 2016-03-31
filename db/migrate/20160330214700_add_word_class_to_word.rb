class AddWordClassToWord < ActiveRecord::Migration
  def change
    add_column :words, :word_class, :integer, default: 0, null: false
  end
end
