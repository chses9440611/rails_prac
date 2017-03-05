class CandidatesController < ApplicationController
	before_action :find_candidate, only: [:edit, :update, :destroy, :vote]
	
	def index
		@candidates = Candidate.all
	end

	def new
		@candidate = Candidate.new
	end


	def create
		@candidate = Candidate.new(candidate_params)

		if @candidate.save
			#success
			redirect_to candidates_path, notice: "Add new candidate succeed!"
		else
			#fail
			render :new
		end
	end
	
	def	edit
		#@candidate = Candidate.find_by(id: params[:id])
	end

	def update
		#@candidate = Candidate.find_by(id: params[:id])

		if @candidate.update_attributes(candidate_params)
			#success
			redirect_to candidates_path, notice: "Update succeed!"
		else
			render :edit
		end
	end

	def destroy
		#@candidate = Candidate.find_by(id: params[:id])
		@candidate.destroy if @candidate
		redirect_to candidates_path, notice: "Candidate's datum has been deleted!"
	end
	
	def vote 
		#@candidate = Candidate.find_by(id: params[:id])
		@candidate.increment(:votes)
		@candidate.save
		redirect_to candidates_path, notice: "Vote completed!"
	end

	private
	#below only for inner
	def	candidate_params
		params.require(:candidate).permit(:name, :age, :party, :politics, :experience)
	end
	
	def find_candidate
		@candidate = Candidate.find_by(id: params[:id])
	end
end
