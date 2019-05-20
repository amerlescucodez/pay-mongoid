class User < ApplicationRecord
  include Mongoid::Document
  include Pay::Billable
end
