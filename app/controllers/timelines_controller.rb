class TimelinesController < ApplicationController

	def welcome
	end

	def index
  		@timelines = Timeline.all
	end

	def new		
		@timeline = Timeline.new
	end

  	def create
    	@timeline = Timeline.new(timeline_params)
    	if @timeline.save
      		redirect_to '/'
    	else
      		render :new
    	end
  	end

  	def show
  		@timeline = Timeline.find(params[:id])
  	end

  	def edit
      @timeline = Timeline.find(params[:id])
  	end

  	def update
      @timeline = Timeline.find(params[:id])
      if @timeline.update_attributes(timeline_params)
        redirect_to '/'
      else 
        render :edit
      end
    end

  	def destroy
      @timeline = Timeline.find(params[:id])
      @timeline.destroy
      redirect_to '/'
  	end

  	private

  	def timeline_params
      	params.require(:timeline).permit(
      		:name, :summary, :creator
      	)
    end

end