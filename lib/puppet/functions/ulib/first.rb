# Returns the first element of an Array, or the first n elements.
#
# @note requires `parser = future`
#
Puppet::Functions.create_function('ulib::first') do
  # TODO: Handle nil arguments and empty arrays.
  dispatch :first_Array do
    param 'Array[Any, 1, default]', :array
  end

  dispatch :first_Array_n do
    param 'Array[Any, 1, default]', :array
    param 'Integer[1, default]', :n
  end

  def first_Array(array)
    array.first
  end

  def first_Array_n(array, n)
    array.first(n)
  end
end
