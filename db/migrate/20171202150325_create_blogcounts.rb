class CreateBlogcounts < ActiveRecord::Migration[5.1]
  def change
    create_table :blogcounts do |t|
      t.string :title
      t.integer :wordcount
      t.string :paragraphs

      t.timestamps
    end
  end
end
