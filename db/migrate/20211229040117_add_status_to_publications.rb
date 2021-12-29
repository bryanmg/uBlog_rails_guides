class AddStatusToPublications < ActiveRecord::Migration[6.1]
  def change
    add_column :publications, :status, :string
  end
end
