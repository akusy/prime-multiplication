class TableGenerator

  def initialize n
    @n = n
    @size = n + 1
    @primes = PrimeGenerator.new(n).generate
    @table = Array.new(size) { Array.new(size) }
  end

  def generate
    @table[0] = [nil] + primes

    (1..n).each do |r|
      (0..n).each do |c|
        if c == 0
          @table[r][c] = @table[0][r]
        else
          @table[r][c] = @table[0][c] * @table[0][r]
        end
      end
    end
    table
  end

  private
  attr_reader :n, :primes, :size, :table

end
