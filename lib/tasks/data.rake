namespace :data_import do
  desc 'import candidates and jobs'
  task :import_candidates_and_jobs => :environment do
    CSV.foreach("./Import-task/Candidates.csv", headers: true) do |row|
      can = Candidate.find_or_create_by(name: row[0], email: (row[1] if row[1].include?("@")))
      can.phone = row[1].to_i.zero? ? row[2] : row[1]
      can.save
      can.jobs.create(name: row[3].strip, created_at: row[4])
    end
  end
end
