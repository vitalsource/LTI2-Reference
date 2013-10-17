class RenameLti2ContextToLti2TpContext < ActiveRecord::Migration
  def up
    rename_table :lti2_contexts, :lti2_tp_contexts
  end

  def down
    rename_table :lti2_tp_contexts, :lti2_contexts
  end
end
