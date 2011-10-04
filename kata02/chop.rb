module Chop

  # iterative chop
  def chop_iterative(number, array)
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

  # recursive chop
  def chop(number, array)
    return -1 if array.empty?

    return 0 if array.size == 1 && array[0] == number
    return -1 if array.size == 1 && array[0] != number

    middle = array.size / 2

    if array[middle]==number
      return middle
    elsif number > array[middle]
      result = chop(number, array.slice(middle, array.size - middle))
      return result < 0 ? -1 : middle+result
    else
      result = chop(number, array.slice(0, middle))
      return result < 0 ? -1 : result
    end

  end

end