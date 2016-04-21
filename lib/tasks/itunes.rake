namespace :itunes do
  desc "Fetch artist info from itunes api"
  task :fetch, [:name] => [:environment] do |_t, args|
    FetchArtistJob.perform_now(args[:name])
  end
end
