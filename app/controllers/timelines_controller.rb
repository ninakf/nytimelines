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
    	@timeline = Timeline.create(timeline_params)

      @articles = Article.search(params["timeline"]["query"], @timeline)
      if @timeline.save!
        redirect_to timeline_path(@timeline)
      else
        render :new
      end
  	end

  	def show
  		@timeline = Timeline.find(params[:id])
      @articles = @timeline.articles
      @arti
  	end

  	def edit
      @timeline = Timeline.find(params[:id])
      @articles = @timeline.articles
  	end

  	def update
      @timeline = Timeline.find(params[:id])
      @articles = @timeline.articles
      if @timeline.update_attributes(timeline_params)
        redirect_to timelines_path
      else 
        render :edit
      end
    end

  	def destroy
      @timeline = Timeline.find(params[:id])
      @timeline.destroy
        redirect_to '/'
      @article = 
      @article.destroy
        redirect_to timeline_path(@timeline)
  	end

  	def timeline_params
      	params.require(:timeline).permit(
      		:query, :name, :summary, :creator
      	)
    end

end