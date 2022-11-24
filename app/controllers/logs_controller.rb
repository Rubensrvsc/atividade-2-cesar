class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def new
  end

  def create
    @log = Log.new(log_params)
    @log.save
    redirect_to @log
  end

  def edit
    @log = Log.find(params[:id])
  end


  private 
    def log_params
      params.require(:log).permit(:date_approved, :comment_id)
    end
end
