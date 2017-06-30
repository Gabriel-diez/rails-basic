class RemovePublishDateFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :publish_date
  end
end
