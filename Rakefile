namespace :assets do
  task :precompile do
    cmd = "bundle exec"
    cmd += " jekyll build"
    cmd += " --config _config.yml"
    cmd += " --drafts"
    sh cmd
  end
end

task :watch_drafts do
  sh "./script/auto_commit _drafts"
end
