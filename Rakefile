task :all do
  puts 'running tests and generating output file'
  ruby 'test/players_reader_test.rb'
  ruby 'test/raw_player_test.rb'
  ruby 'test/player_test.rb'
  ruby 'lib/runner.rb'
end

task :tests do
  puts 'running tests'
  ruby 'test/players_reader_test.rb'
  ruby 'test/raw_player_test.rb'
  ruby 'test/player_test.rb'
end

task :output do
  puts 'generating target output file'
  ruby 'lib/runner.rb'
end
