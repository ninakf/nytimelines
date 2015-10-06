class TimelinesController < ApplicationController

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

	def timeline_params
		params.require(:timeline).permit(
			:name, :summary
			)
	end

end