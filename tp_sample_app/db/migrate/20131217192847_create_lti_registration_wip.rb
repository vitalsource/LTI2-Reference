class CreateLtiRegistrationWip < ActiveRecord::Migration
  def change
    create_table "lti_registration_wips", :force => true do |t|
      t.string  :tenant_name
      t.string  :lti_version
      t.text    :tool_consumer_profile
      t.text    :tool_profile
      t.string  :registration_return_url
      t.string  :message_type
      t.text    :tool_proxy
      t.string  :state
      t.integer :result_status
      t.string  :result_message
      t.string  :support_email
      t.string  :product_name

      t.timestamps
    end
  end
end
