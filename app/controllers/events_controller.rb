class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @attends = AttendRsvp.where(:event_id => params[:id], :attending => true)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      elses
      render :edit
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title)
    end

    def Attend
      redirect_to "/events" and return if !user_signed_in?
      opts = {:event_id => params[:id], :user_id => current_user.id}
      @rsvp = AttendRsvp.where(opts).first || AttendRsvp.new(opts)
      @rsvp.attending = true
        if @rsvp.save
          format.html { redirect_to events_path, notice: 'Thanks for volunteering!' }
        else
          format.html { redirect_to events_path, notice: 'You are already registered to volunteer for the event!' }
        end
    end

    def unattend
    @rsvp = AttendRsvp.where(:event_id => params[:id], :user_id => current_user).first
    @events = Event.all
    respond_to do |format|
      if not @rsvp.nil? and @rsvp.update_attribute(:attending, false)
        format.html { redirect_to events_path, notice: 'Try some other events of your choice' }
        #redirect_to events
      else
        format.html { redirect_to events_path, notice: 'Please Signup to join this event' }
      end
    end
  end


end
