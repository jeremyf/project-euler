module FactorService
  # Implementing Euclid's Algorithm for greatest common denominator
  # @see https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/the-euclidean-algorithm
  def self.gcd(a, b)
    # Assumes a is larger than b
    # return gcd(b, a) if b > a
    a, b = b, a%b until b.zero?
    a
  end

  def self.lcm(a, b)
    a * b / gcd(a, b)
  end

  def self.proper_divisors_of(value)
    divisors = [1]
    Math.sqrt(value).to_i.downto(2).each do |i|
      if value % i == 0
        divisors << i
        divisors << value / i
      end
    end
    divisors.sort
  end

  def self.factors_of(value:)
    return [1] if value == 1
    factors = [1]
    numerator = value
    (2..value).each do |i|
      numerator = recurse_on_factors(numerator: numerator, factors: factors, possible_factor: i)
      break if numerator == 0
    end
    factors
  end

  def self.recurse_on_factors(numerator:, factors:, possible_factor:)
    return numerator unless numerator % possible_factor == 0
    factors << possible_factor
    numerator = numerator / possible_factor
    recurse_on_factors(numerator: numerator, factors: factors, possible_factor: possible_factor)
  end
end

if __FILE__ == $0
  require 'rspec/autorun'
  RSpec.describe FactorService do
    describe '.gcd' do
      describe 'for 270 & 192' do
        subject { described_class.gcd(270, 192) }
        it { is_expected.to eq(6) }
      end
      describe 'for 5 & 17' do
        subject { described_class.gcd(5, 17) }
        it { is_expected.to eq(1) }
      end
      describe 'for 100 & 10' do
        subject { described_class.gcd(100, 10) }
        it { is_expected.to eq(10) }
      end
      describe 'for 36 & 8' do
        subject { described_class.gcd(36, 8) }
        it { is_expected.to eq(4) }
      end
    end
    describe '.lcm' do
      describe 'for 21 & 6' do
        subject { described_class.lcm(21, 6) }
        it { is_expected.to eq(42) }
      end
      describe 'for lcm 5 & 17' do
        subject { described_class.lcm(5, 17) }
        it { is_expected.to eq(85) }
      end
    end
    describe '.proper_divisors_of' do
      describe 'for 220' do
        subject { described_class.proper_divisors_of(220) }
        it { is_expected.to eq([1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]) }
      end
      describe 'for 284' do
        subject { described_class.proper_divisors_of(284) }
        it { is_expected.to eq([1, 2, 4, 71, 142]) }
      end
    end
    describe '.factors_of' do
      subject { described_class.factors_of(value: value) }
      describe 'value: 1' do
        let(:value) { 1 }
        it { is_expected.to eq([1]) }
      end
      describe 'value: 2' do
        let(:value) { 2 }
        it { is_expected.to eq([1,2]) }
      end
      describe 'value: 3' do
        let(:value) { 3 }
        it { is_expected.to eq([1,3]) }
      end
      describe 'value: 4' do
        let(:value) { 4 }
        it { is_expected.to eq([1,2,2]) }
      end
      describe 'value: 5' do
        let(:value) { 5 }
        it { is_expected.to eq([1,5]) }
      end
      describe 'value: 6' do
        let(:value) { 6 }
        it { is_expected.to eq([1,2,3]) }
      end
      describe 'value: 7' do
        let(:value) { 7 }
        it { is_expected.to eq([1,7]) }
      end
      describe 'value: 8' do
        let(:value) { 8 }
        it { is_expected.to eq([1,2,2,2]) }
      end
    end
  end
end
