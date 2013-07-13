module AutoRefactor
  describe Mutator do
    
    describe ".mutate" do
      let(:ruby_parser) { RubyParser.new }

      describe "boolean mutations" do
        describe "unary operations" do

          describe "simple booleans" do
            it "mutates non-negation to negation" do
              sexp = ruby_parser.parse 'x'
              expect(subject.complement(sexp)).to eq ruby_parser.parse('!x')
            end
            
            it "mutates negation to non-negation" do
              sexp = ruby_parser.parse '!x'
              expect(subject.complement(sexp)).to eq ruby_parser.parse('x')
            end
          end

          describe "complex booleans" do
            it "mutates non-negation to negation"
            it "mutates negation to non-negation"
          end
        end

        describe "binary mutations" do
          let(:sexp) { ruby_parser.parse('x && y') }
          
          it "mutates an 'and' (&&) to an 'or' (||)" do
            expect(subject.mutate(sexp, :and, :or)).to eq ruby_parser.parse('x || y')
          end
          
          it "does not change original sexp as a side-effect" do
            expect {
              subject.mutate(sexp, :and, :or)
            }.to_not change{sexp}
          end
        end
      end
    end
  end
end
