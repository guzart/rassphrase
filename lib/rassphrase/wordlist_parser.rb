module Rassphrase
  class WordlistParser
    def self.parse_line(line)
      items = line.split(' ')
      {:code => items[0], :word => items[1]}
    end

    def self.parse(file_path)
      wordlist = {}
      File.open(file_path, 'r') do |file|
        while line = file.gets
          parts = self.parse_line(line)
          wordlist[parts[:code]] = parts[:word]
        end
      end
      return wordlist
    end
  end
end