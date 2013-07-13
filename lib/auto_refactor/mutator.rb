module AutoRefactor
  class Mutator

    def complement sexp
      result = sexp.dup
      if sexp.last == :!
        # s(:call, s(:call, nil, :x), :!) --> s(:call, nil, :x)
        result.shift
        result.pop
        return result.first
      else
        # s(:call, nil, :x) --> s(:call, s(:call, nil, :x), :!)
        result = [result]
        result.unshift :call
        result.push :!
        return result
      end
    end

    def mutate sexp, from, to
      return sexp.dup.find_and_replace_all(from, to)
    end
  end
end
