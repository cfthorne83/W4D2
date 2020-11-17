require "byebug"
require_relative "employee"

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss=nil)
    super
    @employees = []
  end

  def total_salary
    salary = 0
    
    self.employees.each do |employee|
      if employee.class == Manager
        salary += employee.salary
        salary += employee.total_salary
      else
        salary += employee.salary
      end
    end
    salary 
  end

  def bonus(multiplier)
    self.total_salary * multiplier
  end

  def add_employee(employee)
    employees << employee
  end
end

ned = Manager.new("Ned", "founder", 1000000)
darren = Manager.new("Darren", "TA manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)

p ned.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000

