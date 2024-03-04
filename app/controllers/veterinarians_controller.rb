class VeterinariansController < ApplicationController
  before_action :set_veterinarian, only: %i[show edit update destroy]
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @veterinarians = Veterinarian.all
  end

  def show; end

  def new
    @veterinarian = Veterinarian.new
  end

  def edit; end

  def create
    @veterinarian = Veterinarian.new(veterinarian_params)

    respond_to do |format|
      if @veterinarian.save
        format.html { redirect_to @veterinarian, notice: 'Veterinarian was successfully created.' }
        format.json { render :show, status: :created, location: @veterinarian }
      else
        format.html { render :new }
        format.json { render json: @veterinarian.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @veterinarian.update(veterinarian_params)
        format.html { redirect_to @veterinarian, notice: 'Veterinarian was successfully updated.' }
        format.json { render :show, status: :ok, location: @veterinarian }
      else
        format.html { render :edit }
        format.json { render json: @veterinarian.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @veterinarian.destroy
    respond_to do |format|
      format.html { redirect_to veterinarians_url, notice: 'Veterinarian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_veterinarian
    @veterinarian = Veterinarian.find(params[:id])
  end

  def veterinarian_params
    params.require(:veterinarian).permit!
  end

  def invalid_foreign_key
    redirect_to veterinarians_path, notice: 'Veterinarian can not be destroyed.'
  end
end
