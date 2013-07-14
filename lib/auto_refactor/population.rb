require 'forwardable'

module AutoRefactor
  class Population
    extend Forwardable

    attr_reader :candidates
    def_delegator :candidates, :max

    def initialize population_size
      @candidates = []
      @population_size = population_size
    end

    def populate sexp, &population_strategy  
      @population_size.times do
        candidates << yield(sexp)
      end
    end
  end
end
