describe PrimeGenerator do

  describe "#generate" do

    context "When n > 0 is given" do

      it "generates array of 10 prime numbers" do
        subject = PrimeGenerator.new(10)
        expectation = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

        expect(subject.generate).to eq expectation
      end

      it "generates array of 100 prime numbers" do
        subject = PrimeGenerator.new(100)
        table_of_numbers = subject.generate

        expect(table_of_numbers).to include(521, 523, 541)
        expect(table_of_numbers.size).to eq 100
      end

    end

    context "When n == 0 is given" do

      it "returns empty array" do
        subject = PrimeGenerator.new(0)

        expect(subject.generate).to be_empty
      end

    end

  end

end
