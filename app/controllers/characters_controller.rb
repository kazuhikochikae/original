class CharactersController < ApplicationController
  def show
    @chara = current_user
  end
end
