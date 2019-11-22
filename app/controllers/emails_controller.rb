class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email=Email.new(object: Faker::Book.title, body: Faker::Lorem.sentence)
    #(@email.save)? (format.js { }) : (flash[:notice] = "Il y a eut un problème")
    @email.save
    
    respond_to do |format|
      format.html do 
        #code en cas de requête classique 
        redirect_to root_path
      end
    
      format.js do
        #code en cas de requête AJAX
      end
    end
  end

  def show
    @email=Email.find(params[:id])
    @email.read = true
    @email.save
    respond_to do |format|
      format.html { redirect_to email_path(@email.id)}
      format.js { }
    end
  end
  
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.read = false
    @email.save
    respond_to do |format|
      format.html { redirect_to email_path(@email.id)}
      format.js { }
    end
  end

end
