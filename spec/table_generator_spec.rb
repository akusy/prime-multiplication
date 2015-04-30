describe TableGenerator do

  describe "#generate" do

    context "When n > 0 is given" do

      it "generates multiplication table of 4 prime numbers" do
        subject = TableGenerator.new(4)
        expectation = [ [nil, 2, 3, 5],
                        [2, 4, 6, 10],
                        [3, 6, 9, 15],
                        [5, 10, 15, 25]]

        expect(subject.generate).to eq expectation
      end

    end

    context "When n == 0 is given" do

      it "returns two-dimensional array with nil" do
        subject = TableGenerator.new(0)

        expect(subject.generate).to eq [[nil]]
      end

    end

  end

end
