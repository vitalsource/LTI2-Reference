class ToolSetting < ActiveRecord::Base
  belongs_to :scopeable, :polymorphic => true
end