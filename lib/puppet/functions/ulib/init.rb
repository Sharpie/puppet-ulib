# Returns an array created by excluding the last element, or last n elements,
# of an input array.
#
# @note requires `parser = future`
#
Puppet::Functions.create_function('ulib::init') do
  dispatch :init_Array do
    param 'Array[Any, 1, default]', :array
  end

  dispatch :init_Array_n do
    param 'Array[Any, 1, default]', :array
    param 'Integer[1, default]', :n
  end

  def init_Array(array)
    length = array.length - 1
    return [] if (length < 1)
    call_function('ulib::first', array, length)
  end

  def init_Array_n(array, n)
    length = array.length - n
    return [] if (length < 1)
    call_function('ulib::first', array, length)
  end
end
