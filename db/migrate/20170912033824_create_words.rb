class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :spell
      t.string :part_of_speech
      t.text :definition
      t.text :translation
      t.belongs_to :user

      t.timestamps
    end

    add_index :words, :spell
  end
end
