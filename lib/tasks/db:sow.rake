namespace :db do
    desc "drops, migrates and sows new seeds for development"
    task :sow do
        ENV['RAILS_ENV'] = 'development'
        sow
    end
end

namespace :db do
    namespace :test do
        desc "drops, migrates and sows new seeds for test"
        task :sow do
            ENV['RAILS_ENV'] = 'test'
            sow
        end
    end
end

def sow
    system 'rails db:drop'
    system 'rails db:migrate'
    system 'rails db:seed'
end