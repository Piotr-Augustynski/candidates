# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    @candidates = Candidate.all
  end
end
