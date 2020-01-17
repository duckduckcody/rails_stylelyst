namespace :db do
  namespace :dev do
    desc 'drops, migrates and sows new seeds for development'
    task :sow do
      ENV['RAILS_ENV'] = 'development'
      sow
    end
  end

  namespace :test do
    desc 'drops, migrates and sows new seeds for test'
    task :sow do
      ENV['RAILS_ENV'] = 'test'
      sow
    end
  end

  namespace :prod do
    desc 'drops, migrates and sows new seeds for production'
    task :sow do
      ENV['RAILS_ENV'] = 'production'
      sow
    end
  end
end

def sow
  system 'rails db:drop'
  system 'rails db:schema:load'
  system 'rails db:seed'
end
