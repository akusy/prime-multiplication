class Cli

  def initialize argv
    @argv = commands(argv)
  end

  def call
    case argv[0]
    when "--count"
      print_table_command
    else
      p "Unrecognized command"
    end
  end

  private
  attr_reader :argv

  def print_table_command
    command_validator

    TablePrinter.new(argv[1]).print_table
  end

  def command_validator
    unless is_numerical(argv[1])
      raise IncorrectArgumentCommandError, 'Incorrect command argument'
    end
  end

  def is_numerical arg
    /\A\d+\z/.match(arg.to_s)
  end

  def commands argv
    argv.map { |el| /\A\d+\z/.match(el) ? el.to_i : el }
  end
end

class IncorrectArgumentCommandError < ArgumentError
end
