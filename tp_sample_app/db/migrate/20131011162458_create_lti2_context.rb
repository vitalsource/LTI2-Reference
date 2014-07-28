class CreateLti2Context < ActiveRecord::Migration
  def change
    create_table "lti2_contexts", :force => true do |t|
      t.text  :content
      t.timestamps
    end
  end
end
