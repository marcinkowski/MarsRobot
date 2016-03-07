require 'grid'

RSpec.describe(Grid) do
  let(:grid) { Grid.new(15, 10) }

  it 'saves scent points' do
    grid.add_scent(15, 5, Grid::EAST)
    expect(grid.scent?(15, 5, Grid::EAST)).to be true
    expect(grid.scent?(15, 2, Grid::EAST)).to be false
  end

  it 'tells when you facing the edge' do
    expect(grid.edge?(15, 5, Grid::EAST)).to be true
    expect(grid.edge?(14, 5, Grid::EAST)).to be false
  end
end