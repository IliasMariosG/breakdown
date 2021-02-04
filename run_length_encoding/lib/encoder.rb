class Encoder
  def get_length(word)
    word.length
  end

  def get_first_letter(word)
    word[0]
  end

  def get_first_letter_and_length(word)
    get_first_letter(word) + get_length(word).to_s
  end

  def string_to_list(word)
    word.split('')
  end

  def is_all_as?(word)
    string_to_list(word).all? { |element| element == 'a' } 
  end
end
