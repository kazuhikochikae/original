class VrPeopleController < ApplicationController

  def index
    @vr_persons = VrPerson.all
  end

  def new
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

  private

  def vr_person_params
    params.require(:vr_person).permit(:name, :description, :message, :avatar)
  end
  
end
