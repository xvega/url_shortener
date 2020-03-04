class CreateShorteners < ActiveRecord::Migration[5.2]
  def change
    create_table :shorteners do |t|
      t.text :original_url
      t.string :shorten_url
      t.string :sanitized_url

      t.timestamps
    end
  end
end
