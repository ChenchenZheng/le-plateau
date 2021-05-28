class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profil
  end

  def dashboard
    @participations = Participation.all
  end
end
