require 'byebug'
class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(user_id: params[:user_id])
    @shares_contacts = User.find(params[:user_id]).shared_contacts
    render json: @shares_contacts + @contacts
  end

  def create
    @contacts = Contact.new(contact_params.merge({user_id: params[:user_id]}))
    if @contacts.save
      render json: @contacts
    else
      render(
        json: @contacts.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    Contact.delete(params[:id])
    render json: @contact
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email)
  end
end
