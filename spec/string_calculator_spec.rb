require_relative '../string_calculator'

RSpec.describe 'String Calculator' do
    it 'returns 0 for an empty string' do
        expect(add("")).to eq(0)
    end

    it 'returns the sum of comma-separated numbers' do
        expect(add("1,2,3")).to eq(6)
    end
    
    it 'handles newlines as delimiters' do
    expect(add("1\n2,3")).to eq(6)
    end
end