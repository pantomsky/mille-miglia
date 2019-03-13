class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy] # pozwala przegladac tylko wlasne "tracks"
  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = current_user.tracks
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @tracks = current_user.tracks
    #moje :
    @driver = Driver.all
  end

  # GET /tracks/new
  def new
   @track = current_user.tracks.build
   # @track = Tracks.new
    @driver = Driver.all
  end

  # GET /tracks/1/edit
  def edit
    @driver = Driver.all
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = current_user.tracks.build(track_params)
    
   # Pruba dodania kierowcy do trasy 
    @track = Track.find(params[:driver_id])
    @driver = @Track.comments.create(comment_params)
    redirect_to driver_path(@track)

    
    
    

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:origin_address, :dest_address, :distance, :driver_id)
    end
    
    # Definicja uprawnionego uzytkownika:
    def correct_user
      @track = current_user.tracks.find_by(id: params[:id])
      redirect_to tracks_path, notice: "Nie masz uprawnień aby przglądać tą stronę" if @track.nil?
    end  
end
