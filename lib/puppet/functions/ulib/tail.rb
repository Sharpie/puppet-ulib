# Returns an array created by excluding the first element, or first n elements,
# of an input array.
#
# @note requires `parser = future`
#
Puppet::Functions.create_function('ulib::tail') do
  # TODO: Handle nil arguments and empty arrays.
  dispatch :tail_Array do
    param 'Array[Any, 1, default]', :array
  end

  dispatch :tail_Array_n do
    param 'Array[Any, 1, default]', :array
    param 'Integer[1, default]', :n
  end

  def tail_Array(array)
    length = array.length - 1
    return [] if (length < 1)
    call_function('ulib::last', array, length)
  end

  def tail_Array_n(array, n)
    length = array.length - n
    return [] if (length < 1)
    call_function('ulib::last', array, length)
  end
end
