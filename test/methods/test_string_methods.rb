module TestStringMethods
  def test_string_respond_to_size
    obj = ''
    assert obj.cerubis_respond_to?(:size)
  end

  def test_string_respond_to_empty
    obj = ''
    assert obj.cerubis_respond_to?(:empty?)
  end
end
