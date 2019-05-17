namespace :assets do
  task :precompile do
    sh "bundle exec jekyll build --drafts --config _config.yml,_config-heroku.yml"
  end
end

task :watch_drafts do
  sh "./script/auto_commit _drafts"
end
