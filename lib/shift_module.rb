module ShiftModule
  def create_letters
    ("a".."z").to_a
  end

  def shift_array(key, date)
    new_offset = @offset.make_offset(date)
    shift_array = key.zip(new_offset)
    shift_array.map {|num| num.sum }.flatten
  end

  def shift_generator(key, date)
    key_array = ["A", "B", "C", "D"]
    key_array.zip(shift_array(key, date)).to_h
  end

  def shift_hash(key, date)
      new_shift = shift_array(key, date)
      key_array = [0, 1, 2, 3]
      @encrypter = key_array.reduce({}) do |encrypter, num|
        encrypter[num] = Hash[create_letters.zip(create_letters.rotate(new_shift[num]))]
        encrypter
      end
  end
end
