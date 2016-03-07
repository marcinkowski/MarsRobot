require 'robot'
require 'grid'

RSpec.describe(Robot) do
  let(:grid) { Grid.new(5, 3) }

  it 'moves on the grid' do
    robot = Robot.new(grid, Grid::EAST, 1, 1).navigate('RFRFRFRF')
    expect(robot.coordinates).to eq('11E')
  end

  it 'gets lost' do
    robot = Robot.new(grid, Grid::NORTH, 3, 2).navigate('FRRFLLFFRRFLL')
    expect(robot.coordinates).to eq('33NLOST')
  end

  it 'uses scent of previous robot to avoid getting lost' do
    Robot.new(grid, Grid::NORTH, 3, 2).navigate('FRRFLLFFRRFLL')
    robot = Robot.new(grid, Grid::WEST, 0, 3).navigate('LLFFFLFLFL')
    expect(robot.coordinates).to eq('23S')
  end
end