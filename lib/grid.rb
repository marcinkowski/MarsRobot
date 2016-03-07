class Grid
  NORTH = 'N'
  SOUTH = 'S'
  EAST = 'E'
  WEST = 'W'

  def initialize(max_x, max_y, min_x=0, min_y=0)
    @max_x = max_x
    @max_y = max_y
    @min_x = min_x
    @min_y = min_y
    @scents = []
  end

  def edge?(x, y, heading)
    (x >= @max_x && heading == EAST)  ||
    (x <= @min_x && heading == WEST)  ||
    (y >= @max_y && heading == NORTH) ||
    (y <= @min_y && heading == SOUTH)
  end

  def add_scent(x, y, heading)
    @scents << { x: x, y: y, heading: heading }
  end

  def scent?(x, y, heading)
    @scents.include?({ x: x, y: y, heading: heading })
  end
end