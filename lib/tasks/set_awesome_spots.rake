desc "This task sets awesome spots based on votes count"
task :set_awesome_spots => :environment do
  puts "Setting awesome spots"
  DeclareAwesomeSpotsJob.perform_later
  puts "done."
end
