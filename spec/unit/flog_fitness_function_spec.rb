require 'spec_helper'

module AutoRefactor
  describe FlogFitnessFunction do

    describe '.evaluate' do

      let(:fitness_function) { FlogFitnessFunction.new }
      subject { fitness_function }
      
      context 'when s-expression is empty' do
        let(:sexp) { Sexp.from_array [] }

        it 'raises an invalid sexp exception' do
          expect {
            subject.evaluate sexp
          }.to raise_error InvalidSexp
        end
      end

      context 'when s-expression is not a method' do
        # if a == b; return 1; else; return 2; end
        let(:sexp) { Sexp.from_array [:if, [:call, [:call, nil, :a], :==, [:call, nil, :b]], [:lasgn, :x, [:lit, 1]], [:lasgn, :x, [:lit, 2]]] }

        it 'raises a not supported expection' do
          expect {
            subject.evaluate sexp
          }.to raise_error NotSupportedSexpType
        end
      end      

      context 'when s-expression is an a method' do
        # def foo(a, b); if a == b; return 1; else; return 2; end; end
        let(:sexp) { Sexp.from_array [:defn, :foo, [:args, :a, :b], [:if, [:call, [:lvar, :a], :==, [:lvar, :b]], [:return, [:lit, 1]], [:return, [:lit, 2]]]] }

        it 'evaluates fitness' do
          expect(subject.evaluate(sexp)).to eq 2.55
        end
      end
    end
  end
end
