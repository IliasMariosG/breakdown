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

  def is_all_this_letter?(word, letter)
    string_to_list(word).all? { |element| element == letter }
  end

  def is_all_first_letter?(word)
    string_to_list(word).all? { |element| element ==  get_first_letter(word)}
  end

  def get_length_of_first_run(word)
    consecutive_characters_length = word.each_char.chunk_while(&:==).map(&:length)
    consecutive_characters_length[0]
  end
end
