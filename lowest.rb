# Task
# Given an array of integers, remove the smallest value. Do not mutate the original array/list. If there are multiple elements with the same value, remove the one with a lower index. If you get an empty array/list, return an empty array/list.

# Don't change the order of the elements that are left.

# Examples
# remove_smallest([1,2,3,4,5]) = [2,3,4,5]
# remove_smallest([5,3,2,1,4]) = [5,3,2,4]
# remove_smallest([2,2,1,2,1]) = [2,2,2,1]

# def remove_smallest(array)
#   smallest = array.min
  # new_array = []
  # i = 0
  # for a in array
  #   if a != smallest
  #     new_array << a
  #   elsif a == smallest and i == 0
  #     i += 1
  #   else

  #   end
  # end
  # return print new_array
# end 

def remove_smallest(array)
  smallest = array.min
  number = array.count(smallest)
  new_array = []
  i = 0
  for a in array
    if a != smallest
      new_array << a
    else
      i += 1
      if i != 0
        new_array << a
      end
    end
  end
  return print new_array
end

remove_smallest([2, 2, 1, 2, 1])
