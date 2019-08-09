class ApplicationController < ActionController::Base
  before_action :set_cocktails

  def set_cocktails
    @cocktails = Cocktail.all
  end
end
