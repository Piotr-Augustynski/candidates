class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
