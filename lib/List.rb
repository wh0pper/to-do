#!/usr/bin/env ruby

class List < ActiveRecord::Base
  has_many(:tasks)
end
