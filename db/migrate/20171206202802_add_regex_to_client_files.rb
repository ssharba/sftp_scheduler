class AddRegexToClientFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :client_files, :regex, :string
  end
end
