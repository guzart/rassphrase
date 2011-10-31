module Rassphrase
  class Rassphrase
    
    # Initializes an instance of Rassphrase with the specified options
    # 
    # The rassphrase options are:
    # * :dice => An instance of a class with a method roll, that returns a random number.
    # * :size => The default number of words in a passphrase
    # * :capitalize => Indicates if the words should be capitalize in the passphrase [defaults to true]
    # * :wordlist_path => A path to a file containing a wordlist
    # * :wordlist => The hash to use as a wordlist
    def initialize(options = {})
      @wordlist = []
      @dice = options[:dice] || Dice.new
      @size = options[:size] || 5
      @capitalize = options[:capitalize] || true
      wordlist_path = options[:wordlist_path] || File.expand_path('../../diceware.wordlist', __FILE__)
      self.wordlist = options[:wordlist] || WordlistParser::parse(wordlist_path)
      self.generate
    end

    # The codes for the words used in the current passphrase.
    def codes
      @codes ||= []
    end

    # Generates a new passphrase.
    # If a size is specified then it generates a passphrase with the given size.
    def generate(options = nil)
      capitalize = @capitalize
      if options.kind_of?(Hash)
        size = options[:size] || @size
        capitalize = options[:capitalize] if options.has_key?(:capitalize)
      else
        size = options || @size
      end
      @words, @codes = [], []
      size.times do
        item = random_item
        @codes << item[:code]
        @words << item[:word]
      end
      self.passphrase(capitalize)
    end

    # Generates random code
    def generate_code
      code = ''
      5.times { code << @dice.roll.to_s }
      return code
    end

    # Returns the size of the passphrase
    def length
      self.words.length
    end

    alias :size :length

    # Returns the generated passphrase
    def passphrase(capitalize = nil)
      capitalize = @capitalize if capitalize == nil
      return self.words.join unless capitalize
      self.words.map { |w| w.capitalize }.join
    end

    # Returns a random item from the wordlist
    def random_item
      word = nil
      until word do
        code = self.generate_code
        word = self.word(code)
      end
      {:code => code, :word => word}
    end

    # Returns the word for the specified code searching the wordlist.
    def word(code)
      @wordlist[code.to_s]
    end

    # Assigns a new wordlist
    def wordlist=(wordlist)
      wordlist = WordlistParser::parse(wordlist) if wordlist.is_a?(String) && File.file?(wordlist)
      @wordlist = wordlist.inject({}){ |wl, (k,v)| wl[k.to_s] = v; wl}
    end

    # Returns the words used in the passphrase
    def words
      @words ||= []
    end

  end
end