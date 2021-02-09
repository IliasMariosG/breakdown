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
    first_chunk = word.each_char.chunk_while(&:==).first
    first_chunk.length
  end

  def get_first_run(word)
    first_chunk = word.each_char.chunk_while(&:==).first
    first_chunk.join('')
  end

  def get_after_first_run(word)
    word[get_length_of_first_run(word)..]
  end

  def get_all_runs(word)
    runs = []
    while word.length > 0
      first_run = get_first_run(word)
      runs << first_run
      rest_of_string = get_after_first_run(word)
      word = rest_of_string
    end
    runs
  end

  def get_lengths_of_all_runs(word)
    lengths = []
    get_all_runs(word).each{ |element| lengths << get_length(element) }
    lengths
  end

  def get_first_letter_and_length_of_runs(word)
    first_letters_all_runs_length = []
    get_all_runs(word).each { |chunk|
      first_letters_all_runs_length << "#{get_first_letter_and_length(chunk)}" }
    first_letters_all_runs_length
  end

  def get_first_letter_and_length_of_runs_with_special(word)
    first_letters_all_runs_length = []
    get_all_runs(word).each { |chunk|
      if chunk.length > 1
        first_letters_all_runs_length << "#{get_first_letter(chunk)}#{get_length(chunk)}"
      else
        first_letters_all_runs_length << "#{get_first_letter(chunk)}"
      end
    }
    first_letters_all_runs_length
  end
end
