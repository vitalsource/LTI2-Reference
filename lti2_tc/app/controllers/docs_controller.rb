class DocsController < ApplicationController
  
  def show
    filename = params['filename'] 
    if filename =~ /.pdf$/
      send_file filename, :disposition => 'inline'
    else
      render :file => filename
    end
  end

end