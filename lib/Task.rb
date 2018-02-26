#!/usr/bin/env ruby
class Task < ActiveRecord::Base
    scope(:not_done, -> do
      where({:done => false})
  end)
end
