class Trie
  attr_accessor :root

  TrieNode = Struct.new(:children, :end)

  def initialize
    @root = TrieNode.new(Hash.new, false)
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
        node.children[letter] = TrieNode.new(Hash.new, (i == word.size-1))
        node = node.children[letter]
      end
    end
  end

  def find_prefix(word)
    node = @root
    for i in (0...word.size)
      letter = word[i]
      if node.children.has_key?(letter)
        node = node.children[letter]
        if node.end == true
          return node
        end
      else
        return nil
      end
    end
    return node
  end

  def inorder(node, s, words)
    if node.end == true && !s.empty?
      words << s
      return
    end
    node.children.keys.each do |key|
      child = node.children[key]
      inorder(child, "#{s}#{key}", words)
    end
    return
  end
end

# @param {String[]} words
# @return {Integer[][]}
def palindrome_pairs(words)
  pairs = []
  hash = Hash.new
  for i in (0...words.size)
    word = words[i]
    hash[word] = i
  end

  for i in (0...words.size)
    word = words[i]
    if hash.has_key?(word) && hash[word] != i
      pairs << [i, hash[word]]
    end
    word = word.reverse
    if hash.has_key?(word) && hash[word] != i
      pairs << [i, hash[word]]
    end
  end
  return pairs
end

puts palindrome_pairs(["abcd", "dcba", "lls", "s", "sssll"]).to_s #["bat", "tab", "cat"]).to_s