namespace :assets do
  task :precompile do
    sh "bundle exec jekyll build  --config _config.yml,_config-heroku.yml --drafts"
  end
end

task :watch_drafts do
  sh "./script/auto_commit _drafts"
end
