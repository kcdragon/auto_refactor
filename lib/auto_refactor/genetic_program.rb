require 'forwardable'

module AutoRefactor
  class GeneticProgram

    attr_accessor :mutation_rate, :crossover_rate, :pool_size, :iteration_limit

    attr_reader :candidates

    def initialize sexp
    end

    def run
      @candidates = []
    end
  end
end
