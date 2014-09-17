desc "Publish to http://developer.dribbble.com"
task :publish do
  print "Enter a commit message: "

  STDOUT.flush

  message = STDIN.gets.chomp.strip.gsub(/'/, "")

  if message.nil? || message == ""
    message = "Publish latest changes."
  end

  sh "bundle exec nanoc compile"

  ENV["GIT_DIR"] = File.expand_path(`git rev-parse --git-dir`.chomp)

  old_sha = `git rev-parse refs/remotes/origin/gh-pages`.chomp

  Dir.chdir("output") do
    ENV["GIT_WORK_TREE"] = Dir.pwd
    ENV["GIT_INDEX_FILE"] = index_file = "/tmp/development.dribbble.index"

    if File.file?(index_file)
      File.unlink(index_file)
    end

    `git add -A`

    tree_sha = `git write-tree`.strip

    puts "Created tree... #{tree_sha}"

    if old_sha.size == 40
      commit_sha = `git commit-tree #{tree_sha} -p #{old_sha} -m '#{message}'`.strip
    else
      commit_sha = `git commit-tree #{tree_sha} -m '#{message}'`.strip
    end

    puts "Created commit... #{commit_sha}"
    puts `git show #{commit_sha} --stat`
    puts "Updating gh-pages..."

    `git update-ref refs/heads/gh-pages #{commit_sha}`
    `git push origin gh-pages`
  end
end
