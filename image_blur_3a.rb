class Image

  def initialize (image_array)
    @image = image_array
  end

  def output_image
    @image.each {|row| puts row.join}
  end

  def find_ones
    ones = []
    @image.each_with_index do |row, y_index|
      row.each_with_index do |cell, x_index|
        ones << [y_index, x_index] if cell == 1
      end
    end
    ones #each y-x coordinate pair is stored as a 2-element array
  end

  def manhattan_distance (origin_coords, destination_coords)
    (origin_coords[0] - destination_coords[0]).abs + (origin_coords[1] - destination_coords[1]).abs #measure distance from origin point to destination point
  end

  def blur! (distance)
    one_coords = find_ones

    @image.each_with_index do |row, y_index|
      row.each_with_index do |cell, x_index|
        one_coords.each do |origin_coords|
          if manhattan_distance(origin_coords, [y_index, x_index]) <= distance #for each cell in the 2D array, check if each 1's Y-X coordinates is within the manhattan distance of X of it
            @image[x_index][y_index] = 1
          end
        end
      end
    end
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
])

image.output_image
puts "--------------------"
image.blur!(3)
image.output_image
