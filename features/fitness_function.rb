Given /^an s-expression$/ do # TODO change s-expression to a string version of an s-expression
  @sexp = Sexp.new # Sexp.from_array...
end

Given /^a fitness function$/ do
  @fitness_function = FitnessFunction.flog
end

Then /the fitness value is (\d+)/ do |fitness_value|
  expect(@fitness_function.evaluate(@sexp)).to_be eq fitness_value
end
