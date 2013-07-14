$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'ruby_parser'

require 'auto_refactor/flog_fitness_function'

Given /^a program "(.+)"$/ do |program|
  @sexp = RubyParser.new.parse(program)
end

Given /^a fitness function$/ do
  @fitness_function = AutoRefactor::FlogFitnessFunction.new
end

Then /the fitness value is (\d+\.\d+)/ do |fitness_value|
  expect(@fitness_function.evaluate(@sexp)).to eq fitness_value.to_f
end
