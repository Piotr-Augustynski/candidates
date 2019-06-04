class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :content
      t.references :candidate, index: true, foreign_key: true
    end
  end
end
