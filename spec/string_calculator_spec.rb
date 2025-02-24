require_relative '../string_calculator'

RSpec.describe 'String Calculator' do
    it 'returns 0 for an empty string' do
        expect(add("")).to eq(0)
    end

    it 'extracts and return delimeters from numbers' do
        expect(extract_delimiter("1,2,3")).to eq([/,|\n/, "1,2,3"])
    end

    it 'extracts and return delimeters from numbers' do
        expect(extract_delimiter("//;\n1;2;3")).to eq([";", "1;2;3"])
    end
end