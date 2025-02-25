require_relative '../string_calculator'

RSpec.describe 'String Calculator' do
    it 'returns 0 for an empty string' do
        expect(add("")).to eq(0)
    end

    it 'raises an error if the input string exceeds 10,000 characters' do
        long_string = "1,"*5001
        expect {(add(long_string))}.to raise_error("Input string is too long (max: 10,000 characters, provided: #{long_string.length})")
    end    

    it 'ignores numbers greater than 1000' do
        expect(add("2,1001")).to eq(2)  # 1001 is ignored
    end

    it 'returns the sum of comma-separated numbers' do
        expect(add("1,2,3")).to eq(6)
    end

    it 'handles newlines as delimiter' do
        expect(add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiter' do
        expect(add("//$\n1$2")).to eq(3)
      end    

    it 'returns message for negative values' do
        expect { add("1,-2,3,-4") }.to raise_error("Negative numbers not allowed: -2, -4")
    end

    describe 'manages delimeter' do
        it 'returns default delimiters (comma and newline) if no custom delimiter is provided' do
            delimiter, numbers = extract_delimiter("1,2,3")
            expect(delimiter).to eq(/,|\n/)
            expect(numbers).to eq("1,2,3")
        end

        it 'extracts a single-character custom delimiter' do
            delimiter, numbers = extract_delimiter("//;\n1;2;3")
            expect(delimiter).to eq(";")
            expect(numbers).to eq("1;2;3")
        end        
    end

    describe 'parses input numbers' do
        it 'extracts a single-character custom delimiter' do
            delimiter, numbers = extract_delimiter("//;\n1;2;3")
            num_list = parse_numbers(delimiter, numbers)
            expect(num_list).to eq([1,2,3])
        end        
    end
end