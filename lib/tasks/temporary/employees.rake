namespace :employees do
  desc "Migrate entity_id for employees to the new mobility system"
  task migrate_entity_id_to_mobility: :environment do

    counter = 0
    ActiveRecord::Base.transaction do
      employees = Employee.all

      puts "About to update #{employees.count} employees"
      employees.each do |e|
        if e.entity_id.present? and e.mobility_entries.empty?
          e.mobility_entries.create!(
              entity_id: e.entity_id,
              from_date: nil,
              to_date: nil,
              override_entity_soc_sec: e.soc_sec
          )
          print "."
          counter += 1
        end
      end
    end

    puts "All done now! #{counter} mobility entries created"
  end

  desc "Print env variables"
  task :echo_env do
    puts "RAILS_ENV: #{ENV['RAILS_ENV']}"
    puts "DB_HOST: #{ENV['DB_HOST']}"
    puts "DB_NAME: #{ENV['DB_NAME']}"
    puts "DB_PASSWORD: #{ENV['DB_PASSWORD']}"
    puts "DB_USER: #{ENV['DB_USER']}"
  end
end