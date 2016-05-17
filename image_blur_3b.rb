class Image

  def initialize (image_array)
    @image_array = image_array
  end

  def output_image
    @image_array.each {|row| puts row.join}
  end

  def blur!
    @image_array.each_with_index do |row,y_index|
      row.each_with_index do |cell,x_index|
        if cell == 1 #use "m" as a placeholder to show modified digits so test fails for them instead of daisy chaining off of recently modified 1's
          @image_array[y_index -1][x_index] = "m" unless y_index == 0  #change digit above origin unless on edge
          @image_array[y_index +1][x_index] = "m" unless y_index == @image_array.length - 1  #change digit below origin unless on edge
          @image_array[y_index][x_index -1] = "m" unless x_index == 0 #change digit left of origin unless on edge
          @image_array[y_index][x_index +1] = "m" unless x_index == row.length - 1 #change digit right of origin unless on edge
        end
      end
    end
    @image_array.each {|row|row.map!{|x|x == "m" ? 1 : x}} #now replace all "m" placeholders with 1 in array
  end

  def blur(distance)
    distance.times {blur!}
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
image.blur(4)
image.output_image
