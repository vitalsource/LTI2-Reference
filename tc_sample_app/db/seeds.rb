# This file should contain all the record creation needed to seed the database with its default values.
puts "Reseeding #{Rails.env}"
Lti2Tc::DeploymentRequest.delete_all
Lti2Tc::ToolConsumerProfile.delete_all
Lti2Tc::Resource.delete_all
Lti2Tc::Tool.delete_all
Lti2Tc::Link.delete_all
GradeItem.delete_all
GradeResult.delete_all
Lti2Tc::ToolSetting.delete_all


