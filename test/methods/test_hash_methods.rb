module TestHashMethods
  def test_hash_respond_to_empty
    obj = {}
    assert obj.cerubis_respond_to?(:empty?)
  end

  def test_hash_respond_to_size
    obj = {}
    assert obj.cerubis_respond_to?(:size)
  end
end
