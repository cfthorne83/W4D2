class Employee
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) if !boss.nil?
  end

  def bonus(multiplier)
    self.salary * multiplier
  end
end
