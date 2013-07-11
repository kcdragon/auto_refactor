Feature: Calculate Fitness of an S-expression
  In Order to evaluate the quality of a candidate solution
  As a genetic algorithm
  I want to be able to calculate the fitness of a candidate solution

  Scenario Outline: Calculate the fitness of an s-expression
    Given an s-expression
    And a fitness function
    Then the fitness value is <fitness>

  Examples:
    | fitness |
    | 1       |
