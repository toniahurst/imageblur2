@image = [[0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0]]

@blur =   [[0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0]]

   @image.each_with_index do |row, row_count|
      row.each_with_index do |cell_contents, location|
          if @image[row_count][location] == 1 
            @blur[row_count][location] = 1
            @blur[row_count + 1][location] = 1
            @blur[row_count - 1][location] = 1
            @blur[row_count][location + 1] = 1
            @blur[row_count][location - 1] = 1
         end
       end
     end

puts ""
puts "Image Is:"
puts "_________"
@image.each do |row|
  puts row.join
end

puts ""
puts "Blur is:"
puts "_________"
@blur.each do |row|
  puts row.join
end