require 'flog'

module AutoRefactor
  class InvalidSexp < Exception; end
  class NotSupportedSexpType < Exception; end

  class FlogFitnessFunction

    def initialize
      @flog = Flog.new
    end
    
    # Evaluates the fitness of an Sexp object using Flog
    #
    def evaluate sexp
      raise InvalidSexp if sexp.empty?
      raise NotSupportedSexpType if sexp.sexp_type != :defn

      method = "main##{sexp.rest.head.to_s}" # TODO generalize this for a class
      @flog.process sexp
      return @flog.calls[method].values.inject(&:+)
    end
  end
end
