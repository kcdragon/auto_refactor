Feature: Calculate Fitness of an S-expression
  In Order to evaluate the quality of a candidate solution
  As a genetic algorithm
  I want to be able to calculate the fitness of a candidate solution

  Scenario Outline: Calculate the fitness of an s-expression
    Given a program "<program>"
    And a fitness function
    Then the fitness value is <fitness>

  Examples:
    | program                                                                    | fitness |
    | def foo(a, b); if a == b; return 1; else; return 2; end; end               | 2.55    |
    | def bar(array); array.each do \|e\|; e.each do \|x\|; puts x end; end; end | 5.4     |
