class Trie
  attr_accessor :root

  TrieNode = Struct.new(:end, :children)

  def initialize
    @root = TrieNode.new(false, Hash.new)
  end

  def add_word(word)
    node = @root
    i = 0
    for i in (0...word.size) do
      letter = word[i]
      if node.children.has_key?(letter)
        node = node.children[letter]
        if i == word.size-1
          node.end = true
        end
      else
        node.children[letter] = TrieNode.new((i == word.size-1), Hash.new)
        node = node.children[letter]
      end
    end
  end
end

trie = Trie.new
trie.add_word("abc")
trie.add_word("a")
puts trie.root.children.to_s