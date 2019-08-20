class GamecontrolsController < ApplicationController
  before_action :check_character

  def wild
    @level = Level.find(params[:level])
  end

  private

  def check_character
    redirect_to new_character_path if current_user.characters.empty?
  end
end
