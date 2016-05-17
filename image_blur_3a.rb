class Image

  def initialize (image_array)
    @image = image_array
  end

  def output_image
    @image.each {|row| puts row.join}
  end

  def generate_ones
    ones = []
    @image.each_with_index do |row, x_index|
      row.each_with_index do |cell, y_index|
        ones << [x_index, y_index] if cell == 1
      end
    end
    ones
  end

  def manhattan_distance (origin_coords, destination_coords)
    (origin_coords[0] - destination_coords[0]).abs + (origin_coords[1] - destination_coords[1]).abs #measure distance from origin point to destination point
  end

  def blur! (distance)
    one_coords = generate_ones

    @image.each_with_index do |row, y_index|
      row.each_with_index do |cell, x_index|
        one_coords.each do |origin_coords|
          if manhattan_distance(origin_coords, [x_index, y_index]) <= distance
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
