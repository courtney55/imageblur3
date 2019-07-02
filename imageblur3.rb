class Image

  def initialize(image)
      @image = image
  end

  def output_image
    @image.each do |row|
      puts row.join
    end  
  end

  def blur(distance=3)
    distance.times do
      blur_ones 
    end
  end

  def blur_ones
    blur_ones = []
    @image.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        blur_ones << [x, y] if cell == 1
      end
    end
    
    blur_ones.each do |location|
      @image[location[0]][location[1] + 1] = 1 if location[1] + 1 <= @image[location[0]].length - 1
      @image[location[0]][location[1] - 1] = 1 if location[1] - 1 >= 0
      @image[location[0] + 1][location[1]] = 1 if location[0] + 1 <= @image.length - 1
      @image[location[0] - 1][location[1]] = 1 if location[0] - 1 >= 0
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 1, 0],
  [0, 1, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]  
])

image.blur
image.output_image 