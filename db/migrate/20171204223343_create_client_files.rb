class CreateClientFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :client_files do |t|
      t.string :file_format
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
