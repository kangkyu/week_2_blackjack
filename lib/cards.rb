class Cards
  include Enumerable

  def each &block
    each do |c|
      block.call c
    end
  end
end
