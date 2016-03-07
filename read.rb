Dir["./lib/*"].each {|file| require file }

unless ARGV[0] && File.exists?(ARGV[0])
  raise RuntimeError.new('Incorrect path to file with instructions.');
end

file_path = ARGV[0]
max_x, max_y = File.open(file_path, &:readline).strip.split('')
grid = Grid.new(max_x.to_i, max_y.to_i)

File.readlines(file_path).drop(1).each do |line|
  position, instructions = line.split(' ')
  x, y, heading = position.split('')

  puts Robot.new(grid, heading, x.to_i, y.to_i).navigate(instructions).coordinates
end