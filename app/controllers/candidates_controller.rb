# frozen_string_literal: true

class CandidatesController < ApplicationController
  def show
    @candidate = find_candidate
    @jobs = @candidate.jobs.order("created_at DESC")
    @notes = @candidate.notes
  end

  private

  def find_candidate
    Candidate.find(params[:id])
  end
end
