class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	
	def index

	end

	def show

	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to @job
		else
			render 'new'
		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	private

	def find_job
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:name, :company, :description)
	end
end
