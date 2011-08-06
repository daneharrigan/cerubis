module TestArrayMethods
  def test_array_responds_to_empty
    obj = []
    assert obj.cerubis_respond_to?(:empty?)
  end

  def test_array_responds_to_size
    obj = []
    assert obj.cerubis_respond_to?(:size)
  end

  def test_array_responds_to_first
    obj = []
    assert obj.cerubis_respond_to?(:first)
  end

  def test_array_responds_to_last
    obj = []
    assert obj.cerubis_respond_to?(:last)
  end
end
