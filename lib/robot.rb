class Robot
  FORWARD_INSTRUCTION = 'F'
  RIGHT_INSTRUCTION = 'R'
  LEFT_INSTRUCTION = 'L'

  def initialize(grid, heading, x=0, y=0)
    @grid = grid
    @heading = heading
    @x = x
    @y = y
    @lost = false
  end

  def navigate(instructions)
    unless instructions.kind_of?(Array)
      instructions = instructions.split('')
    end

    raise 'Wrong directions.' unless instructions_valid?(instructions)

    instructions.each do |instruction|
      case instruction
        when FORWARD_INSTRUCTION
          move_forward
        when RIGHT_INSTRUCTION
          turn_right
        when LEFT_INSTRUCTION
          turn_left
      end
    end

    self
  end

  def move_forward
    unless (@grid.scent?(@x, @y, @heading))

      if (@grid.edge?(@x, @y, @heading))
        @grid.add_scent(@x, @y, @heading)
        @lost = true
      end

      case @heading
        when Grid::NORTH
          @y += 1
        when Grid::SOUTH
          @y -= 1
        when Grid::EAST
          @x += 1
        when Grid::WEST
          @x -= 1
      end
    end
  end

  def turn_left
    case @heading
      when Grid::NORTH
        @heading = Grid::WEST
      when Grid::SOUTH
        @heading = Grid::EAST
      when Grid::EAST
        @heading = Grid::NORTH
      when Grid::WEST
        @heading = Grid::SOUTH
    end
  end

  def turn_right
    case @heading
      when Grid::NORTH
        @heading = Grid::EAST
      when Grid::SOUTH
        @heading = Grid::WEST
      when Grid::EAST
        @heading = Grid::SOUTH
      when Grid::WEST
        @heading = Grid::NORTH
    end
  end

  def coordinates
    "#{@x}#{@y}#{@heading}#{'LOST' if @lost}"
  end

  private

  def instructions_valid?(directions)
    directions.all? do |direction|
      [FORWARD_INSTRUCTION, RIGHT_INSTRUCTION, LEFT_INSTRUCTION].include? direction
    end
  end
end