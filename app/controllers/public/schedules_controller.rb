class Public::SchedulesController < ApplicationController

  def index
    @schedule = Schedule.new
    @schedules = current_user.schedules.all
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.save
    redirect_to schedules_path
  end

  def show
    @schedule = Schedule.find(params[:id])
    @schedules = current_user.schedules.all
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    redirect_to schedule_path(@schedule.id)
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :body, :start_time, :user_id, :end_time)
  end

end
