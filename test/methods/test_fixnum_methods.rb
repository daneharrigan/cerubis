module TestFixnumMethods
  def test_fixnum_respond_to_zero
    obj = 0
    assert obj.cerubis_respond_to?(:zero?)
  end
end
