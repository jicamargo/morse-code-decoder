def morse_code_decode_char(morse_char)
  morse_code_dictionary = {
    '.-' => 'A', '-...' => 'B', '-.-.' => 'C', 
    '-..' => 'D', '.' => 'E', '..-.' => 'F', 
    '--.' => 'G', '....' => 'H', '..' => 'I', 
    '.---' => 'J', '-.-' => 'K', '.-..' => 'L', 
    '--' => 'M', '-.' => 'N', '---' => 'O',
    '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', 
    '...' => 'S', '-' => 'T', '..-' => 'U', 
    '...-' => 'V', '.--' => 'W', '-..-' => 'X', 
    '-.--' => 'Y', '--..' => 'Z'
  }

  myChar = morse_code_dictionary[morse_char]
  #puts "Evaluating #{morse_char} ==> #{myChar}"
  myChar ||= '' # If myChar is nil, set it to ''
  myChar
end

# decode an entire word in Morse code, takes a string parameter, 
# and return the string representation. 
# Every character in a word will be separated by a single space (e.g. decode_word("-- -.--") returns "MY").
def morse_code_decode_word(morse_word)
  decoded_word = ''
  morse_chars = morse_word.split(' ') # Split word into characters
  morse_chars.each do |morse_char|
    decoded_word << morse_code_decode_char(morse_char)
  end
  return decoded_word
end

# Decode the entire message in Morse code, takes a string parameter,
# and return the string representation. Every word will be separated by 3 spaces
def morse_code_decode_message(morse_message)
  decoded_message = ''
  morse_words = morse_message.split('   ') # Split message into words
  morse_words.each do |morse_word|
    decoded_message << morse_code_decode_word(morse_word)
    decoded_message << ' ' # Add space between words
  end
  return decoded_message.strip # Remove trailing spaces and return the decoded message
end

# Get Morse code input from the user
puts "Enter the Morse code message:"
morse_code_input = gets.chomp

# Call the morse_code_decoder method and print the decoded text
decoded_msg = morse_code_decode_message(morse_code_input)
puts "Decoded message: #{decoded_msg}"
