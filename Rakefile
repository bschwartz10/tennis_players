task :all do
  puts 'running tests and generating output file'
  ruby 'test/player_io_test.rb'
  ruby 'test/player_test.rb'
  ruby 'test/sorted_player_collection_test.rb'
  ruby 'lib/runner.rb'
end

task :tests do
  puts 'running tests'
  ruby 'test/player_io_test.rb'
  ruby 'test/player_test.rb'
  ruby 'test/sorted_player_collection_test.rb'
end

task :output do
  puts 'generating target output file'
  ruby 'lib/runner.rb'
end
