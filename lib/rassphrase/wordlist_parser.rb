module Rassphrase
  # Parses a file into a Hash, where the key is the 
  # code, and the value is the word.
  # The file should have an item per line, where the code and the word
  # are separated by a space.
  # Example:
  # 12345 hello
  # 12346 world
  # 12351 foo
  class WordlistParser

    # Parses a line into a hash with :code, and :word.
    def self.parse_line(line)
      items = line.split(' ')
      {:code => items[0], :word => items[1]}
    end

    # Parses a file with wordlist items.
    # A path to the file must be given as the first argument.
    def self.parse(file_path)
      wordlist = {}
      File.open(file_path, 'r') do |file|
        while line = file.gets
          parts = self.parse_line(line)
          wordlist[parts[:code].to_s] = parts[:word]
        end
      end
      return wordlist
    end
  end
end