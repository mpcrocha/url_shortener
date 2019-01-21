class CreateShortUrl < ActiveRecord::Migration[5.1]
  def up
    create_table :short_urls do |t|
      t.string :original_url
      t.string :shortened_url
    end
  end

  def down
    drop_table :short_urls
  end
end
