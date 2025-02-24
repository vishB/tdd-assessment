require_relative '../string_calculator'

RSpec.describe 'String Calculator' do
    it 'returns 0 for an empty string' do
        expect(add("")).to eq(0)
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