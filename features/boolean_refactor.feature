Feature: Refactor Boolean Expression
  In Order to make my code more maintainable
  As a programmer
  I want to be able to refactor a method with a boolean expression

  Scenario: Refactor a boolean expression using Genetic Programming
    Given the program
    """
    def success?; (!foo.nil? && foo.valid?) || (!foo.nil? && foo.persisted?); end
    """
    And a mutation rate of 0.1
    And a crossover rate of 0.5
    And a pool size of 10
    And an iteration limit 0f 100
    Then the program should be refactored to
    """
    def success?; !foo.nil? && (foo.valid? || foo.persisted?); end
    """
