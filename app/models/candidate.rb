# frozen_string_literal: true

class Candidate < ApplicationRecord
  has_many :jobs
  has_many :notes
end
