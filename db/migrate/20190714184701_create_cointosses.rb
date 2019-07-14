class CreateCointosses < ActiveRecord::Migration[5.2]
  def change
    create_table :cointosses do |t|
      t.string :parameters
      t.string :result

      t.timestamps
    end
  end
end
