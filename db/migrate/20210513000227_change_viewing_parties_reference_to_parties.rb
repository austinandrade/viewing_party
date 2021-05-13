class ChangeViewingPartiesReferenceToParties < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_party_guests, :viewing_party_id, :party_id
  end
end
