desc "create and tag release for saving and restoring rails assets"
task :release do
  previous_version = get_previous_version
  current_version = previous_version.succ

  create_release("save_rails_assets", current_version)
  create_release("restore_rails_assets", current_version)
end

def get_previous_version
  `git fetch --tags && git tag -l`.scan(/^v(\d+)/).flatten.map(&:to_i).max || 0
end

def compile_contents(function_name)
  File.read("templates/compile").gsub("FUNCTION_TO_CALL", function_name)
end

def commit_and_tag_version(function_name, version)
  command = <<~COMMAND
    set -x
    git add bin/compile &&
      git commit -m 'creating bin/compile for v#{version}-#{function_name}' &&
      git tag v#{version}-#{function_name} head &&
      git reset --hard head~1
  COMMAND

  output = `#{command}`

  if $?.exitstatus != 0
    fail <<~ERROR
        The following command failed to run:

        #{command}

        The output captured was:

      #{output}
    ERROR
  else
    puts "\e[032mCreated release v#{version}-#{function_name}\e[0m"
  end

end

def create_release(function_name, version)
  contents = compile_contents(function_name)

  File.write("bin/compile", contents)

  commit_and_tag_version(function_name, version)
end
