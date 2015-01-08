class JokesController < ApplicationController
  before_action :set_joke, only: [:show, :edit, :update, :destroy]
    
  # GET /jokes
  # GET /jokes.json
  def index
    @user_id ||= session[:user_id] if session[:user_id]
    @jokes = Joke.where(:user_id => @user_id)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # GET /jokes/1
  # GET /jokes/1.json
  def show
  end

  # GET /jokes/new
  def new
    @joke = Joke.new
  end

  # GET /jokes/1/edit
  def edit
    @joke = Joke.find(params[:id])
    @joke.minutes = @joke.length / 60
    @joke.seconds = @joke.length % 60
  end

  # POST /jokes
  # POST /jokes.json
  def create
    @joke = Joke.new(joke_params.except(:minutes, :seconds))
    @joke.user_id ||= session[:user_id] if session[:user_id]
    @joke.score = joke_params[:score].to_i
    @joke.length = joke_params[:minutes].to_i * 60 + joke_params[:seconds].to_i
    @joke.writeDate = Date.strptime(joke_params[:writeDate], "%Y-%m-%d") 
    respond_to do |format|
      if @joke.save
        format.html { redirect_to @joke, notice: 'Joke was successfully created.' }
        format.json { render :show, status: :created, location: @joke }
      else
        format.html { render :new }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jokes/1
  # PATCH/PUT /jokes/1.json
  def update
    @joke = Joke.find(params[:id])
    @joke.name = joke_params[:name]
    @joke.bodyText = joke_params[:bodyText]
    @joke.score = joke_params[:score].to_i
    @joke.length = joke_params[:minutes].to_i * 60 + joke_params[:seconds].to_i
    @joke.writeDate = Date.strptime(joke_params[:writeDate], "%Y-%m-%d") 
    respond_to do |format|
      if @joke.update
        format.html { redirect_to @joke, notice: 'Joke was successfully updated.' }
        format.json { render :show, status: :ok, location: @joke }
      else
        format.html { render :edit }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jokes/1
  # DELETE /jokes/1.json
  def destroy
    @joke.destroy
    respond_to do |format|
      format.html { redirect_to jokes_url, notice: 'Joke was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joke
      @joke = Joke.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joke_params
      params.require(:joke).permit(:name, :bodyText, :length, :score, :user_id, :writeDate, :minutes, :seconds)
    end

end
