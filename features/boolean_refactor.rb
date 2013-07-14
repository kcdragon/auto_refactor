$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'ruby_parser'
require 'ruby2ruby'

Given /^the program "(.+)"$/ do |program|
  sexp = RubyParser.new.parse program
  @gp = GeneticProgram.new sexp
end

Given /^a(n?) (.+) of (\d+\.\d+)$/ do |setting, value|
  @gp.send(setting.gsub(' ', '_'), value)
end

Then /^then the program should be refactored to (.+)$/ do |expected_program|
  @gp.run
  refactored_sexp = @gp.candidates.max { |c1, c2| c1.fitness <=> c2.fitness }
  actual_program = Ruby2Ruby.new.process refactored_sexp
  exptect(actual_program).to eq expected_program
end
