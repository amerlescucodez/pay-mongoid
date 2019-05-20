class Team < ApplicationRecord
  include Mongoid::Document
  include Pay::Billable

  belongs_to :owner, class_name: "User"

  def email
    owner.email
  end
end
