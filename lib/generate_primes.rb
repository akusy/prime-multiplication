class GeneratePrimes

  def initialize n
    @n = n
    @prime_candidate = 2
    @counter = @index = 0
    @k = @d = 1
    @primes = []
    @stop = false
  end

  def generate
    while counter < n do
      @stop = false
      if counter < 3
        @prime_candidate += counter
        save_prime_and_increment
        next
      end
      @prime_candidate = (6 * k) + d
      if d == 1
        @d = -1
        @k += 1
      else
        @d = 1
      end
      prime_sqrt = Math.sqrt(prime_candidate).to_i
      @index = 2
      while primes[index] <= prime_sqrt && !stop
        if prime_candidate % primes[index] == 0
          @stop = true
          next
        end
        @index += 1
      end
      next if stop
      save_prime_and_increment
    end
    primes
  end

  private
  attr_reader :n, :prime_candidate, :counter, :index, :k, :d, :primes, :stop

  def save_prime_and_increment
    @primes[counter] = prime_candidate
    @counter += 1
  end
end
