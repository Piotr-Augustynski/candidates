# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    @candidates = Candidate.includes(:jobs, :notes).order(:name)
  end
end
