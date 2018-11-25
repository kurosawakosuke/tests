class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    if params[:back]
      @contact = Contact.new(blog_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "編集しました！"
    else
      render 'new'
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, notice:"削除しました！"
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
