class NotesController < ApplicationController
  
  # create
  def new
    @token = form_authenticity_token
  end

  def create
    note = Note.new
    note.title = params[:input_title]
    note.content = params[:input_content]
    note.save
    
    redirect_to "/notes/#{note.id}"
  end
  
  #Read
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find params[:id]
    @token = form_authenticity_token
  end
  
  #Udpate
  def edit
    @note = Note.find params[:id]
    @token = form_authenticity_token
  end
  
  def update
    note = Note.find params[:id]
    note.title = params[:edit_title]
    note.content = params[:edit_content]
    note.save
    
    redirect_to "/notes/#{note.id}"
  end

  
  #Destroy
  def destroy
    note = Note.find params[:id]
    note.destroy
    
    redirect_to '/'
  end

end
