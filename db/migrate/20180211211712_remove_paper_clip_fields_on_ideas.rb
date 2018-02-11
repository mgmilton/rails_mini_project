class RemovePaperClipFieldsOnIdeas < ActiveRecord::Migration[5.1]
  def change
    remove_column :ideas, :image_file_name,    :string
    remove_column :ideas, :image_content_type, :string
    remove_column :ideas, :image_file_size,    :integer
    remove_column :ideas, :image_updated_at,   :datetime
  end
end
