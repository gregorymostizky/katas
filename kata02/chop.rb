module Chop

  def chop(number, array)
    return -1 if array.empty?

    left = 0
    right = array.size - 1

    begin
      pointer = left + ((right-left) / 2)

      if array[pointer]==number
        return pointer
      elsif number > array[pointer]
        left = left == pointer ? left+1 : pointer
      else
        right = right == pointer ? right-1 : pointer
      end
    end while left<=right

    -1 #not found
  end

end