class CreateSectionEdits < ActiveRecord::Migration
  def change
    create_table :section_edits do |t|

      t.references :admin_user, index: true
      t.references :section, index: true
      t.string :summary
      t.timestamps null: false
    end
  end
end
