class DailiesController < ApplicationController
   before_action :set_daily, only: [ :show, :edit, :update, :destroy ]

  # GET /dailies or /dailies.json
  def index
    @dailies = Daily.all
  end

  # GET /dailies/1 or /dailies/1.json
  def show
  end

  # GET /dailies/new
  def new
    @daily = Daily.new
  end

  # GET /dailies/1/edit
  def edit
  end

  # POST /dailies or /dailies.json
  def create
    @daily = Daily.new(daily_params)

    respond_to do |format|
      if @daily.save
        format.html { redirect_to @daily, notice: "Daily was successfully created." }
        format.json { render :show, status: :created, location: @daily }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dailies/1 or /dailies/1.json
  def update
    respond_to do |format|
      if @daily.update(daily_params)
        format.html { redirect_to @daily, notice: "Daily was successfully updated." }
        format.json { render :show, status: :ok, location: @daily }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailies/1 or /dailies/1.json
  def destroy
    @daily.destroy!

    respond_to do |format|
      format.html { redirect_to dailies_path, status: :see_other, notice: "Daily was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def set_daily
    @daily = Daily.find_by(id: params[:id])
    unless @daily
      redirect_to dailies_path, alert: "Daily not found."
    end
  end
    def daily_params
      params.require(:daily).permit(:title, :content)
    end
end
