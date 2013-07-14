require 'forwardable'

module AutoRefactor
  class GeneticProgram

    attr_accessor :mutation_rate, :crossover_rate, :population_size, :iteration_limit

    attr_reader :population

    def initialize sexp
      
    end

    def run
      @candidates = []
      @population = Population.new population_size
    end
  end
end
