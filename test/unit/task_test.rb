require File.dirname(__FILE__) + '/../test_helper'


class TaskTest < Test::Unit::TestCase

  def test_add_task
    task = Task.new
    task.Id = 8
    task.name = "Sample Task"
    assert task.save
    assert_equal Task.find(8).name, "Sample Task"
  end
  
  def test_get_tasks
    tasks = Task.find(:all)
    assert tasks.length > 0
    
  end  
  
end