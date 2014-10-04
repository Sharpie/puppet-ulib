# Returns the last element of an Array, or the last n elements.
#
# @note requires `parser = future`
#
Puppet::Functions.create_function('ulib::last') do
  # TODO: Handle nil arguments and empty arrays.
  dispatch :last_Array do
    param 'Array[Any, 1, default]', :array
  end

  dispatch :last_Array_n do
    param 'Array[Any, 1, default]', :array
    param 'Integer[1, default]', :n
  end

  def last_Array(array)
    array.last
  end

  def last_Array_n(array, n)
    array.last(n)
  end
end
