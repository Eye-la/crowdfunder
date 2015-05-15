class RemovePledgeAmtFromPledges < ActiveRecord::Migration
  def change
    remove_column :pledges, :pledge_amt, :integer
  end
end
