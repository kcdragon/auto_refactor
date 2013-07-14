require 'spec_helper'

module AutoRefactor
  describe Population do

    describe '.populate' do
      let(:population) { Population.new(10) }
      subject { population }

      it 'populates candidate solutions' do
        sexp = Sexp.from_array []
        expect {
          subject.populate(sexp) do |sexp|
            sexp
          end
        }.to change(subject.candidates, :count).from(0).to(10)
      end

      it 'mutation and crossover as population strategy'
    end
  end
end
