class SetrecordsController < ApplicationController
  before_action :set_setrecord, only: [:show, :edit, :update, :destroy]

  # GET /setrecords
  # GET /setrecords.json
  def index
    @user_id ||= session[:user_id] if session[:user_id]
    @allsetrecords = Setrecord.all
    @setrecords = filterByUserID(@allsetrecords, @user_id);
  end

  # GET /setrecords/1
  # GET /setrecords/1.json
  def show
  end

  # GET /setrecords/new
  # def new
  #   @setrecord = Setrecord.new
  # end

  # # GET /setrecords/1/edit
  # def edit
  # end

  # POST /setrecords
  # POST /setrecords.json
  # def create
  #   @setrecord = Setrecord.new(setrecord_params)

  #   respond_to do |format|
  #     if @setrecord.save
  #       format.html { redirect_to @setrecord, notice: 'Setrecord was successfully created.' }
  #       format.json { render :show, status: :created, location: @setrecord }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @setrecord.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /setrecords/1
  # PATCH/PUT /setrecords/1.json
  # def update
  #   respond_to do |format|
  #     if @setrecord.update(setrecord_params)
  #       format.html { redirect_to @setrecord, notice: 'Setrecord was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @setrecord }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @setrecord.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /setrecords/1
  # DELETE /setrecords/1.json
  def destroy
    @setrecord.destroy
    respond_to do |format|
      format.html { redirect_to setrecords_url, notice: 'Setrecord was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setrecord
      @setrecord = Setrecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setrecord_params
      params[:setrecord]
    end


  def filterByUserID(setsArray, userID)
    resultArray = []

    for i in 0..setsArray.length-1
      set = setsArray[i]
      if (set.user && set.user.objectId)
        objectId = set.user.objectId
        if objectId == userID
          resultArray << set
        end
      end
    end
    return resultArray
  end
  
end
