class VrPeopleController < ApplicationController

  def index
    @vr_persons = VrPerson.all
  end

  def new
    if current_user.vr_person
      redirect_to users_show_path
    end
    @vr_person = VrPerson.new
  end

  def show
    @vr_person = VrPerson.find(params[:id]) # Ensure this fetches the correct record
  end

  def create
    @vr_person = VrPerson.new(vr_person_params)
    @vr_person.user_id = current_user.id
    if @vr_person.save
      redirect_to vr_person_path(@vr_person)
    else
      render :new
    end
  end

  def edit
    @vr_person = VrPerson.find(params[:id])
  end

  def update
    @vr_person = VrPerson.find(params[:id])
    
    if @vr_person.update(vr_person_params)
      redirect_to vr_person_path(@vr_person)
    else
      render :edit
    end
  end



  private

  def vr_person_params
    params.require(:vr_person).permit(:name, :description, :message, :avatar)
  end
  
end
