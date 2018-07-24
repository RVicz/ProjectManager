class AddCompletedAtToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :completed_at, :datetime
  end
end
