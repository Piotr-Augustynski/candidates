# frozen_string_literal: true

namespace :data_import do
  desc 'import date about candidates, jobs and notes'
  task import_all_of_data: :environment do
    CSV.foreach('./Import-task/Candidates.csv', headers: true) do |row|
      can = Candidate.find_or_create_by(name: row[0], email: (row[1] if row[1].include?('@')))
      can.phone = row[1].to_i.zero? ? row[2] : row[1]
      if can.save
        puts "Successfully created candidate: name: #{can.name}\t email: #{can.email}\t phone: #{can.phone}"
      else
        puts "!!! Something was wrong with name: #{can.name}\t email: #{can.email}\t phone: #{can.phone}"
      end
      if can.jobs.create(name: row[3].strip, created_at: row[4])
        puts "Successfully created job for #{can.name}"
      else
        puts "!!! Something was wrong with job for #{can.name}"
      end
    end
    CSV.foreach('./Import-task/Notes.csv', headers: true) do |row|
      candidate = Candidate.find_by(email: row[0])
      note = candidate.notes.build
      note.content = row[1]
      if note.save
        puts "Successfully create note for #{candidate.name}"
      else
        puts "!!! Something was wrong with creating note for #{candidate.name}"
      end
    end
  end
end
