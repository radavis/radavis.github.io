namespace :assets do
  task :precompile do
    sh "bundle exec jekyll build --drafts"
  end
end

task :watch_drafts do
  sh "./scripts/auto_commit.sh _drafts"
end
