class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]

	def index
		

		if  params[:category].blank?
			@jobs = Job.where(user_id: current_user)
		else
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id)
		end

	end

	def show
		@profiles = @job.profiles
	end

	def new
		@job = current_user.jobs.build
	end

	def create
		@job = current_user.jobs.build(job_params)
		if @job.save
			redirect_to @job
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @job.update(job_params)
			redirect_to @job
		else
			render 'edit'
		end
	end

	def destroy
		@job.destroy
		redirect_to jobs_path
	end

	private

	def find_job
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:name, :company, :description, :category_id)
	end
end
