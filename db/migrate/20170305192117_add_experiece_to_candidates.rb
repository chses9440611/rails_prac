class AddExperieceToCandidates < ActiveRecord::Migration[5.0]
  def change
	  add_column :candidates, :experience, :text
  end
end
