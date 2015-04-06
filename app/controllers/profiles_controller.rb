class ProfilesController < ApplicationController
 before_action :authenticate_user!
 before_action :load_job

  def index
  	@profiles = Profile.where(job_id: @job.id)
  end

  def new
    @profile = Profile.new
   # @job = Job.find(params[:jobs_id])
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.job = @job
    if @profile.save
      redirect_to job_path(@job, @profile)
    else
      render 'new'
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end


  private

  def load_job
    @job = Job.find(params[:job_id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :current_company, :status, :profile_url, :notes)
  end


end