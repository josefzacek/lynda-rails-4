class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :subject, index: true, foreign_key: true
      t.string :name
      t.integer :pemalink
      t.integer :position
      t.boolean :visible, default: false

      t.timestamps null: false
    end
    add_index :pages, :pemalink
  end
end
