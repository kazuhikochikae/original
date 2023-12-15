class VrPeopleController < ApplicationController

  def index
    @users = User.where(role: 'vr_person')
  end

  def new
    @vr_person = VrPerson.new
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
    params.require(:vr_person).permit(:name, :description, :message)
  end
  
end
