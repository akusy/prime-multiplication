class TablePrinter

  def initialize n
    @n = n
    @size = n + 1
    @table = TableGenerator.new(n).generate
    @table_print = String.new
  end

  def print_table
    return if n < 1

    add_top_header

    (1..n).each do |r|
      (0..n).each do |c|
        cell = table[r][c]
        @table_print << format_header_cell(cell)
        add_pipe if c == 0
      end
      add_new_line
    end

    $stdout.print(table_print)
  end

  private
  attr_reader :n, :size, :table, :table_print

  def cell_size
    @cell_size ||= table[n][n].to_s.length + 1
  end

  def add_new_line
    @table_print << "\n"
  end

  def add_top_header
    table[0].each_with_index do |c, i|
      @table_print << format_header_cell(c)
      add_pipe if i == 0
    end
    add_new_line
    table_width.times do
      @table_print << '-'
    end
    add_new_line
  end

  def add_pipe
    @table_print << format_header_cell("|")
  end

  def table_width
    (size + 1) * cell_size
  end

  def format_header_cell c
    c = c.to_s
    c.prepend(" " * (cell_size - c.size))
  end
end
