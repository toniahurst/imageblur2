def blur(image) 
  blurred_image =   [[0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0]]

          total_elements = blurred_image.flatten.count
          rows = total_elements/blurred_image[0].count
          cells = total_elements/rows
 
      image.each_with_index do |row, row_count|
        row.each_with_index do |cell_contents, location|
          if image[row_count][location] == 1 
            blurred_image[row_count][location] = 1
            if row_count - 1 >= 0 && row_count - 1 < rows #test for upper cell in bounds
              blurred_image[row_count - 1][location] = 1
            end
            if row_count + 1 >= 0 && row_count + 1 < rows #test for lower cell in bounds
              blurred_image[row_count + 1][location] = 1
            end
            if location - 1 >= 0 && location - 1 < cells #test for left cell in bounds
              blurred_image[row_count][location - 1] = 1
            end
            if location + 1 >= 0 && location + 1 < cells #test for right cell in bounds
              blurred_image[row_count][location + 1] = 1
            end 
          end 
        end 
      end
     return blurred_image
end

def output(image, label)
  puts ""
  puts "Label Is: #{label}"
  puts "_________"
  image.each do |row|
    puts row.join
  end
end

oski =    [[1, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0]]


blurred_oski = blur(oski)
output(oski, "Oski")
output(blurred_oski, "Blurred Oski")
