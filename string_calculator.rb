def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    num_list = parse_numbers(numbers, delimiter)
end

def extract_delimiter(numbers)
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      return Regexp.escape(parts[0][2..-1]), parts[1]
    end
    [/,|\n/, numbers]
end

def parse_numbers(delimiter,numbers)
    numbers.split(Regexp.new(delimiter)).map(&:to_i)
end