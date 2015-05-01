describe Cli do

  describe "#call" do


    context "When command is correct" do
      let(:argv) { ["--count", "5"] }
      let(:cli) { Cli.new(argv) }
      let(:table_printer) { double 'TablePrinter' }

      it "calls printing table" do

        expect(TablePrinter).to receive(:new).with(5).and_return(table_printer)
        expect(table_printer).to receive(:print_table)

        cli.call
      end
    end

    context "When command is incorrect" do
      let(:argv) { ["--unknown", "5"] }
      let(:cli) { Cli.new(argv) }

      it "returns 'Unrecognized command' info" do
        expect(cli.call).to eq 'Unrecognized command'
      end
    end

    context "When command argument is incorrect" do
      let(:argv) { ["--count", "fef"] }
      let(:cli) { Cli.new(argv) }

      it "raises exception due to incorrect argument" do
        expect { cli.call }.to raise_exception(IncorrectArgumentCommandError)
      end
    end

    context "When command argument is empty" do
      let(:argv) { ["--count"] }
      let(:cli) { Cli.new(argv) }

      it "raises exception due to incorrect argument" do
        expect { cli.call }.to raise_exception(IncorrectArgumentCommandError)
      end
    end

  end
end
