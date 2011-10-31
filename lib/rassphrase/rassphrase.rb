module Rassphrase
  class Rassphrase
    
    def initialize(options = {})
      @wordlist = []
      @dice = options[:dice] || Dice.new
      @size = options[:size] || 5
      @capitalize = options[:capitalize] || false
      wordlist_path = options[:wordlist_path] || File.expand_path('../../diceware.wordlist', __FILE__)
      self.wordlist = options[:wordlist] || WordlistParser::parse(wordlist_path)
      self.generate
    end

    def codes
      @codes ||= []
    end

    def generate(size = nil)
      size ||= @size
      @words, @codes = [], []
      size.times do
        item = random_item
        @codes << item[:code]
        @words << item[:word]
      end
      self.passphrase
    end

    def generate_code
      code = ''
      5.times { code << @dice.roll.to_s }
      return code
    end

    def length
      self.words.length
    end

    def passphrase
      return self.words.join unless @capitalize
      self.words.map { |w| w.capitalize }.join
    end

    def random_item
      word = nil
      until word do
        code = self.generate_code
        word = self.word(code)
      end
      {:code => code, :word => word}
    end

    def word(code)
      @wordlist[code.to_s]
    end

    def wordlist=(wordlist)
      wordlist = WordlistParser::parse(wordlist) if wordlist.is_a?(String) && File.file?(wordlist)
      @wordlist = wordlist.inject({}){ |wl, (k,v)| wl[k.to_s] = v; wl}
    end

    def words
      @words ||= []
    end

  end
end