class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :uid

      t.timestamps
    end
    add_index :short_urls,:url
    add_index :short_urls,:uid,:unique => true
  end
end
