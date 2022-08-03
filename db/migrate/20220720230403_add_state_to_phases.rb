class AddStateToPhases < ActiveRecord::Migration[7.0]
  def change
    add_column :phases, :state, :string
  end
end
