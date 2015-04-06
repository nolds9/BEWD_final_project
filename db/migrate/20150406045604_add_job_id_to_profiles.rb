class AddJobIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :job_id, :integer
  end
end
