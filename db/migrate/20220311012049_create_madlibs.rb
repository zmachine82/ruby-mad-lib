class CreateMadlibs < ActiveRecord::Migration[7.0]
  def change
    create_table :madlibs do |t|
      t.string :name
      t.text :template

      t.timestamps
    end
  end
end
