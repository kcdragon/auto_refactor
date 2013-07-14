$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'rspec'
require 'ruby_parser'
require 'ruby2ruby'

require 'auto_refactor'

include AutoRefactor

Given /^the program$/ do |program|
  sexp = RubyParser.new.parse program
  @gp = GeneticProgram.new sexp
end

Given /^an? (.+) of (\d+\.\d+|\d+)$/ do |setting, value|
  setting_message = "#{setting.gsub(' ', '_')}="
  expect(@gp).to respond_to(setting_message)
  @gp.send(setting_message, value)
end

Then /^the program should be refactored to$/ do |expected_program|
  @gp.run
  refactored_sexp = @gp.candidates.max { |c1, c2| c1.fitness <=> c2.fitness }
  actual_program = Ruby2Ruby.new.process refactored_sexp
  expect(actual_program).to eq expected_program
end
