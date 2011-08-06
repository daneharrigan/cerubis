module TestFloatMethods
  def test_float_respond_to_zero
    obj = 0.0
    assert obj.cerubis_respond_to?(:zero?)
  end
end
