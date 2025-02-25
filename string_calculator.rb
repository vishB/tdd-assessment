def add(numbers)
    return 0 if numbers.empty?

    # Check if input string length exceeds 10,000 characters (example limit)
    if numbers.length > 10_000
        raise "Input string is too long (max: 10,000 characters, provided: #{numbers.length})"
    end    

    delimiter, numbers = extract_delimiter(numbers) #get delimeters and numbers
    num_list = parse_numbers(delimiter,numbers) #get final numbers to be calculated

    # check negative number entries
    check_negatives(num_list)

    # return final sum of numbers
    num_list.sum 
end

def extract_delimiter(numbers)
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      return Regexp.escape(parts[0][2..-1]), parts[1]
    end
    [/,|\n/, numbers]
end

def parse_numbers(delimiter,numbers)
    numbers.split(Regexp.new(delimiter)).map(&:to_i).reject { |num| num > 1000 }
end

def check_negatives(num_list)
    negatives = num_list.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
end