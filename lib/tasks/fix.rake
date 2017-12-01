namespace :db do
  desc "Create, migrate, and seed database"
  task :fix do
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end