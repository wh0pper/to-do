require 'spec_helper'

describe('Task') do
  describe('#.not_done') do
    it("returns tasks that aren't done") do
      not_done_task1 = Task.create({:description => "gotta do it", :done => false})
      not_done_task2 = Task.create({:description => "gotta do it too", :done => false})
      done_task = Task.create({:description => "done task", :done => true})
      expect(Task.not_done()).to(eq([not_done_task1, not_done_task2]))
    end
  end
end
describe('List') do
  describe("#tasks") do
    it("tells which tasks are in it") do
      test_list = List.create({:name => "list"})
      test_task1 = Task.create({:description => "task1", :list_id => test_list.id})
      test_task2 = Task.create({:description => "task2", :list_id => test_list.id})
     expect(test_list.tasks()).to(eq([test_task1, test_task2]))
    end
  end
end
