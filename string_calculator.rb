def add(numbers)
    return 0 if numbers.empty?
end

def extract_delimiter(numbers)
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      return Regexp.escape(parts[0][2..-1]), parts[1] # Fixed slicing
    end
    [/,|\n/, numbers]
end