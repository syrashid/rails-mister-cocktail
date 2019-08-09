class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    # attributes = { description: dose_params['description'],
    #                ingredient: Ingredient.find(dose_params['ingredient'].to_i),
    #                cocktail: @cocktail }
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.destroy(params[:id])
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
