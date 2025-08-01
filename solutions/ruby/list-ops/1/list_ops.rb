module ListOps 
  module_function 
  def arrays(array)
    count = 0 
    while count < array.size 
      count += 1
    end 
    count  
  end

  def reverser(array)
    result = []
    (array.size - 1).downto(0) do |i|
      result << array[i]
    end 
    result
  end

  def concatter(array1, array2) 
    for i in array2
      array1 << i 
    end
    array1 
  end

  def mapper(array, &block) 
    result = []
    for i in array 
      result << yield(i)
    end 
    result 
  end

  def filterer(array, &block)
    result = [] 
    for i in array
      result << i if  block.call(i)
    end 
    result
  end

  def sum_reducer(array)
    sum = 0 
    for i in array 
      sum += i 
    end
    sum 
  end

  def factorial_reducer(array)
    factorial = 1 
    for i in array 
      factorial *= i 
    end
    factorial 
  end
end



  