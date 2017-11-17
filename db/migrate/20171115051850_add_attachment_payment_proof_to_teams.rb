class AddAttachmentPaymentProofToTeams < ActiveRecord::Migration[5.1]
  def self.up
    change_table :teams do |t|
      t.attachment :payment_proof
    end
  end

  def self.down
    remove_attachment :teams, :payment_proof
  end
end
