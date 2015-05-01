describe TablePrinter do

  describe "#print_table" do

    context "When n > 0 is given" do

      it "prints formatted table" do
        filepath = 'spec/fixtures/print_out.txt'
        expectation = File.read(filepath)

        subject = TablePrinter.new(10)

        expect($stdout).to receive(:print).with(expectation)

        subject.print_table
      end

    end

    context "When n == 0 is given" do

      it "prints nothing" do
        subject = TablePrinter.new(0)

        expect($stdout).to_not receive(:print)

        subject.print_table
      end

    end

  end

end
